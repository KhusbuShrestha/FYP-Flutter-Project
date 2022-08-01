import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/accountTextController.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/info_message.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/cart_total.dart';
import 'package:flutter_fyp/controller/delivery_address_controller.dart';
import 'package:flutter_fyp/controller/user_detail_controller.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:flutter_fyp/view/login/login.dart';
import 'package:flutter_fyp/view/user_profile/user_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter_fyp/view/global/global.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

   void checkToen() async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     var token = preferences.getString("token");
     if (token == null){
       Get.offAll(LogInPage());
     }
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkToen();
  }

  @override
  Widget build(BuildContext context) {
    var up = Get.find<UserDetailController>();
    var da = Get.find<DeliveryAddressController>();
    // var fc = Get.find<FoodController>();
    // var rsfcl = Get.find<RestaurantFoodCategoryListController>();
    // var fcfl = Get.find<FoodCategoryFoodListController>();
    var ud = Get.find<UserDetailController>();
    // ud.getUserDetail();
    // print(ud.userDetail.value.name);
    // print(ud.userDetail.value.id);
    var ci = Get.find<CartController>();
    var ct = Get.find<CartTotalController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          title: const Text("Cart"),
          centerTitle: true,
          leading: crossButton(context),
          actions: [
            IconButton(
              onPressed: () {
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

                                // Get.to(UserProfile());
                              },
                              child: Text("Submit")),
                          ElevatedButton(
                              onPressed: () {
                                region.clear();
                                city.clear();
                                address.clear();
                                area.clear();
                                Get.back();
                              },
                              child: GText(text: "Cancel"))
                        ],
                      );
                    });
              },
              icon: Icon(Icons.pin_drop_sharp),
              iconSize: 30,
            )
          ],
        ),
        body: Obx(
          () =>
              //  ci.loading.value? Center(child: const CircularProgressIndicator()) : ci.cartItems.value.data.isEmpty? const Center(child: Text("No cart items"),) :
              //  ci.loading.value? Center(child:  Shimmer.fromColors(child: Text("data"), baseColor: Colors.red, highlightColor: Colors.yellow)) : ci.cartItems.value.data.isEmpty? const Center(child: Text("No cart items"),) :
              ci.loading.value
                  ? Center(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(color: Colors.white),
                            child: SkeletonItem(
                                child: Column(
                              children: [
                                Row(
                                  children: [
                                    SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                          shape: BoxShape.rectangle,
                                          width: 20,
                                          height: 20),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: SkeletonParagraph(
                                        style: SkeletonParagraphStyle(
                                            lines: 3,
                                            spacing: 6,
                                            lineStyle: SkeletonLineStyle(
                                              randomLength: true,
                                              height: 10,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              minLength: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              maxLength: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                                // SizedBox(height: 12),
                                // SkeletonParagraph(
                                //   style: SkeletonParagraphStyle(
                                //       lines: 3,
                                //       spacing: 6,
                                //       lineStyle: SkeletonLineStyle(
                                //         randomLength: true,
                                //         height: 10,
                                //         borderRadius: BorderRadius.circular(8),
                                //         minLength:
                                //             MediaQuery.of(context).size.width /
                                //                 2,
                                //       )),
                                // ),
                                // SizedBox(height: 12),
                                // SkeletonAvatar(
                                //   style: SkeletonAvatarStyle(
                                //     width: double.infinity,
                                //     minHeight:
                                //         MediaQuery.of(context).size.height / 8,
                                //     maxHeight:
                                //         MediaQuery.of(context).size.height / 3,
                                //   ),
                                // ),
                                // SizedBox(height: 8),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         SkeletonAvatar(
                                //             style: SkeletonAvatarStyle(
                                //                 width: 20, height: 20)),
                                //         SizedBox(width: 8),
                                //         SkeletonAvatar(
                                //             style: SkeletonAvatarStyle(
                                //                 width: 20, height: 20)),
                                //         SizedBox(width: 8),
                                //         SkeletonAvatar(
                                //             style: SkeletonAvatarStyle(
                                //                 width: 20, height: 20)),
                                //       ],
                                //     ),
                                //     SkeletonLine(
                                //       style: SkeletonLineStyle(
                                //           height: 16,
                                //           width: 64,
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //     )
                                //   ],
                                // )
                              ],
                            )),
                          ),
                        ),
                      ),
                    )
                  : ci.cartItems.value.data.isEmpty
                      ? const Center(
                          child: Text("Cart Items Empty"),
                        )
                      : ct.cartTotal.value.total == 0
                          ? const Center(
                              child: Text("Cart total 0"),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  // cart items
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: ci.cartItems.value.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var mydata =
                                            ci.cartItems.value.data[index];
                                        return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: InkWell(
                                              onTap: () {
                                                // fcfl.getFoodCategoryFoodList(mydata.id);
                                                // Get.to(() => const FoodCategoryFoodListPage());
                                              },
                                              child:
                                                  // Card(
                                                  //   borderOnForeground: true,
                                                  //   color: Colors.grey[200],
                                                  //   child: ListTile(
                                                  //     title: Text(mydata.name),
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.elliptical(
                                                            10, 20),
                                                      ),
                                                      // border: Border.all(
                                                      //     color: AppColors.secondaryText)
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: ListTile(
                                                        leading: GFAvatar(
                                                            backgroundImage:
                                                                NetworkImage(mydata
                                                                    .picture
                                                                    .toString()),
                                                            shape: GFAvatarShape
                                                                .standard),
                                                        // leading: Image.network(mydata.picture!),
                                                        subtitle: GText(
                                                            // text: "Quantity: " +
                                                            //     mydata.quantity.toString() +
                                                            //     ud.userDetail.value.name
                                                            //         .toString()
                                                            text: "Quantity: " +
                                                                mydata.quantity
                                                                    .toString()),
                                                        title: GText(
                                                          text: mydata.name!
                                                              .toUpperCase(),
                                                          fontSize: 14,
                                                          // fontWeight: FontWeight.bold,
                                                        ),
                                                        // subtitle: mydata.,
                                                        trailing: IconButton(
                                                            onPressed:
                                                                () async {
                                                              await RemoteService
                                                                  .deleteData(
                                                                      'cart/' +
                                                                          mydata
                                                                              .id
                                                                              .toString());
                                                              // Get.off(() => const CartPage());
                                                              ci.getCartItems();
                                                              ct.getCartTotal();
                                                            },
                                                            icon: const Icon(
                                                              FontAwesomeIcons
                                                                  .solidTrashAlt,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      ),
                                                    )),
                                              ),
                                            ));
                                      }),
                                  // Column(
                                  //   children: [
                                  //     Expanded(

                                  //       child: GText(
                                  //     text: "Total : " + ct.cartTotal.value.total.toString(),
                                  //     fontWeight: FontWeight.bold,
                                  //     fontSize: 18,
                                  //   )),
                                  //    Expanded(

                                  //       child: GText(
                                  //     text: "Delicery charge : 100" ,
                                  //     fontWeight: FontWeight.bold,
                                  //     fontSize: 18,
                                  //   )),

                                  //   ],
                                  // ),

                                  MaterialButton(
                                    onPressed: () {
                                      up.getUserDetail();
                                      da.getDeliveryAddress();
                                      Get.to(() => const UserProfile());
                                    },
                                    child: Text("Choose delivery Address"),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: GText(
                                          // text: "Total : " + (ct.cartTotal.value.total!+100).toString(),
                                          text: "Total : " +
                                              ct.cartTotal.value.total
                                                  .toString(),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                        Expanded(
                                            child: MaterialButton(
                                          color: AppColors.primarycolor,
                                          onPressed: () async {
                                            if (globals.region.isEmpty || globals.city.isEmpty ||globals.area.isEmpty ||globals.address.isEmpty ) {
                                              infoMessage(
                                                  "Delivery address undefined!");
                                            } else {
                                              Map data = {
                                                // "o_code":
                                                //     DateTime.now().toString(),
                                                "total":
                                                    ct.cartTotal.value.total,
                                                // "deliveryCharge": ,
                                                "grandTotal":
                                                    ct.cartTotal.value.total! +
                                                        100,
                                                "deliveryStatus": "inprocess",
                                                "region": globals.region,
                                                "city": globals.city,
                                                "area": globals.area,
                                                "address": globals.address,
                                              //  Equivalence to foreach loop. 
                                              //it can add multiple products in iteration.
                                                "products": ci
                                                    .cartItems.value.data
                                                    .map((e) {
                                                  return {
                                                    "name": e.name,
                                                    "product_id": e.product,
                                                    "quantity": e.quantity,
                                                    "amount": e.sp,
                                                  };
                                                }).toList()
                                              };

                                              print(data);
                                              await RemoteService.postData(
                                                  'orders', data);
                                              await RemoteService.deleteData(
                                                  'destroyCart');
                                              ci.getCartItems();
                                              ct.getCartTotal();
                                            }
                                          },
                                          child: GText(
                                            text: "Buy Now".toUpperCase(),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
        ),
      ),
    );
  }
}
