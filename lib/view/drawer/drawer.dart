import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fyp/api/api.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/accountTextController.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/error_message.dart';
import 'package:flutter_fyp/const/info_message.dart';
import 'package:flutter_fyp/const/success_message.dart';
import 'package:flutter_fyp/controller/category_controller.dart';
import 'package:flutter_fyp/controller/delivery_address_controller.dart';
import 'package:flutter_fyp/controller/increasing_controller.dart';
import 'package:flutter_fyp/controller/order_controller.dart';
import 'package:flutter_fyp/controller/product_list_category_Controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/controller/user_detail_controller.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/category/category.dart';
import 'package:flutter_fyp/view/login/login.dart';
import 'package:flutter_fyp/view/order/order.dart';
import 'package:flutter_fyp/view/others/about_us.dart';
import 'package:flutter_fyp/view/others/location.dart';
import 'package:flutter_fyp/view/product_list_category/product_list_category.dart';
import 'package:flutter_fyp/view/user_profile/user_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var cat = Get.find<CategoryController>();
    // var plc = Get.find<ProductListCategoryController>();
    var plc = Get.find<ProductListController>();
    var up = Get.find<UserDetailController>();
    var ords = Get.find<OrderController>();
    var inc = Get.find<IncreaseController>();
    var da = Get.find<DeliveryAddressController>();
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColors.primarycolor),
              accountName: Text("GHARDAILO"),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppColors.whitecolor,
                child: Text(
                  'G',
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ),
            ),

            ExpansionTile(
              
              iconColor: Colors.black,
              textColor: Colors.black,
             

              leading: Icon(FontAwesomeIcons.layerGroup),
              title: Text('Category'),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: cat.categoryList.value.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          print(cat.categoryList.value.data[index].id);
                          inc.getIncreaseProductList(
                              cat.categoryList.value.data[index].id);
                          plc.getProductList(
                              cat.categoryList.value.data[index].id);
                          Get.to(() => const ProductListCategory());
                        },
                        child: ListTile(
                          title: Text(cat.categoryList.value.data[index].name),
                        ),
                      );
                    })
              ],
            ),

            // gharListTile('Category', FontAwesomeIcons.layerGroup,'categoryPage'),
            // ListTile(
            //   onTap: () {
            //     ords.getOrders();
            //     Get.to(() => OrderPage());
            //   },
            //   title: GText(text: "Order History"),
            // ),

            const Divider(),
            ListTile(
              title: GText(
                text: 'ACCOUNT',
                fontWeight: FontWeight.bold,
              ),
            ),
            gharListTile('Main Page', FontAwesomeIcons.home, 'mainScreen'),
            // gharListTile('Profile', Icons.person, 'profile'),
            ListTile(
              onTap: () {
                ords.getOrders();
                Get.to(() => OrderPage());
              },
              leading: Icon(
                Icons.list,
              ),
              title: Text('Order List'),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        elevation: 20,
                        title: Text("Please enter delivery details"),
                        content: Container(
                          height: MediaQuery.of(context).size.height * .40,
                          child: Column(
                            children: [
                              TextField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: "region",
                                ),
                                controller: region,
                              ),
                              TextField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    hintText: "city", focusColor: Colors.red),
                                controller: city,
                              ),
                              TextField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: "area",
                                ),
                                controller: area,
                              ),
                              TextField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: "address",
                                ),
                                controller: address,
                              ),
                            ],
                          ),
                        ),
                        // const Text("Invalid email or password"),
                        actions: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primarycolor),
                              ),
                              onPressed: () async {
                                print("submit");
                                // print(distance.text);

                                // if (
                                //     //(region.text).isEmpty ||
                                //     //(city.text).isEmpty ||
                                //     //(area.text).isEmpty ||
                                //     (address.text).isEmpty) {
                                //   // print(distance.text);
                                //   // distance.text = '1.0';
                                //   infoMessage("Please input all the fields");
                                // }

                                Map data = {
                                  "region": region.text,
                                  "city": city.text,
                                  "area": area.text,
                                  "address": address.text
                                };
                                await RemoteService.postData(
                                    'delAddress', data);

                                // if (
                                //     (region.text).isEmpty ||
                                //     (city.text).isEmpty ||
                                //     (area.text).isEmpty ||
                                //     (address.text).isEmpty) {
                                //   // print(distance.text);
                                //   // distance.text = '1.0';
                                //   infoMessage("Please input all the fields");
                                // }

                                // globals.distance = double.parse(distance.text);
                                region.clear();
                                city.clear();
                                address.clear();
                                area.clear();
                                // Get.snackbar('Message', 'Welcome to ghardhailo', snackPosition:SnackPosition.BOTTOM );
                                // Get.to(() => MapPage());
                                // Get.back();
                                Get.to(UserProfile());
                              },
                              child: Text("Submit")),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                            ),
                              onPressed: () {
                                region.clear();
                                city.clear();
                                address.clear();
                                area.clear();
                                Get.back();
                              },
                              child: GText(text: "Cancel", color: Colors.white)) 
                        ],
                      );
                    });
              },
              leading: Icon(
                Icons.delivery_dining,
              ),
              title: Text('Delivery Address'),
            ),
            // gharListTile('Purchase List', Icons.list, 'purchaseList'),
            ListTile(
              onTap: () {
                ords.getOrders();
                Get.to(() => CartPage());
              },
              leading: const Icon(
                Icons.shopping_cart_outlined,
              ),
              title: Text('Cart Page'),
            ),

            // be a seller
            ListTile(
              onTap: () {
                
                // ords.getOrders();
                // Get.to(() => OrderPage());
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        elevation: 20,
                        title: Text("Please enter below details"),
                        content: Container(
                          height: MediaQuery.of(context).size.height * .40,
                          child: Column(
                            children: [
                              TextField(
                                
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: "name",
                                
                                ),
                                controller: sname,
                                
                              ),
                              TextField(
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: "phone number",
                                    focusColor: Colors.red),
                                controller: sphone,
                              ),
                              TextField(
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: "category you want to sell",
                                ),
                                controller: scategory,
                              ),
                              TextField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  hintText: "address",
                                ),
                                controller: saddress,
                              ),
                            ],
                          ),
                        ),
                        // const Text("Invalid email or password"),
                        actions: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primarycolor),
                              ),
                              onPressed: () async {
                                print("submit");
                                // print(distance.text);

                                // if (
                                //     (region.text).isEmpty ||
                                //     (city.text).isEmpty ||
                                //     (area.text).isEmpty ||
                                //     (address.text).isEmpty) {
                                //   // print(distance.text);
                                //   // distance.text = '1.0';
                                //   infoMessage("Please input all the fields");
                                // }

                                Map data = {
                                  "name": sname.text,
                                  "phone_number": sphone.text,
                                  "category": scategory.text,
                                  "address": saddress.text
                                };
                                await RemoteService.postData(
                                    'producer', data);

                                // if (
                                //     (region.text).isEmpty ||
                                //     (city.text).isEmpty ||
                                //     (area.text).isEmpty ||
                                //     (address.text).isEmpty) {
                                //   // print(distance.text);
                                //   // distance.text = '1.0';
                                //   infoMessage("Please input all the fields");
                                // }

                                // globals.distance = double.parse(distance.text);
                                sname.clear();
                                sphone.clear();
                                saddress.clear();
                                scategory.clear();
                                // Get.snackbar('Message', 'Welcome to ghardhailo', snackPosition:SnackPosition.BOTTOM );
                                // Get.to(() => MapPage());
                                // Get.back();
                                // Get.to(UserProfile());
                                // successMessage("")
                              },
                              child: Text("Submit")),
                          ElevatedButton(
                             style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                            ),
                              onPressed: () {
                                region.clear();
                                city.clear();
                                address.clear();
                                area.clear();
                                Get.back();
                              },
                              child: GText(text: "Cancel", color: Colors.white,))
                        ],
                      );
                    });
              },
              leading: Icon(
                FontAwesomeIcons.store,
              ),
              title: Text('Be a seller'),
            ),
            ListTile(
              onTap: () {
                up.getUserDetail();
                da.getDeliveryAddress();
                Get.to(() => const UserProfile());
              },
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('User Profile'),
            ),
            ListTile(
              onTap: () {
                Get.to(() => const LocationPage());
              },
              leading: const Icon(
                Icons.location_on_outlined,
              ),
              title: const Text('Our Location'),
            ),
            const Divider(),
            ListTile(
              title: GText(
                text: 'OTHERS',
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              onTap: () {
                ords.getOrders();
                Get.to(() => AboutUsPage());
              },
              leading: Icon(
                FontAwesomeIcons.infoCircle,
              ),
              title: Text('About US'),
            ),
            gharListTile('Our Team', FontAwesomeIcons.users, 'ourTeam'),
            // gharListTile('Shipping Policy', FontAwesomeIcons.shippingFast,
            //     'shippingPolicy'),
            gharListTile(
                'Contact Us', FontAwesomeIcons.addressCard, 'contactUs'),
            // gharListTile('Feed Back', FontAwesomeIcons.comment,'feedBack'),

            const Divider(),
            ListTile(
             onTap: () async {
               Map data = {};
              //  var response = await Api().postData(data, 'logout');
               var response = await Api().logOut(data, 'logout');
               var result = json.decode(response.body);
               print(result);
               print(response.statusCode);

               if (response.statusCode == 200){
                 SharedPreferences preferences = await SharedPreferences.getInstance();
                 preferences.remove("token");
                 Get.offAll(LogInPage());
               }
               else{
                 errorMessage("Network Error");
               }
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.remove('email');
                // Get.offAll(const LogInPage());
              }, 

              leading: const Icon(
                // FontAwesomeIcons.signOutAlt,
                Icons.logout_sharp,
                color: AppColors.blackColor,
              ),
              title: Text("Log out"),
              tileColor: Colors.white24,
            ),
          ],
        ),
      ),
    );
  }

  ListTile gharListTile(String title, IconData iconData, String route) {
    return ListTile(
      onTap: () {
        print(route);

        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
      // trailing: Icon(Icons.arrow_right),
      leading: FaIcon(
        iconData,
        size: 20,
      ),
      title: GText(
        text: "$title",
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
