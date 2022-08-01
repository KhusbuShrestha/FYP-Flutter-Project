import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/success_message.dart';
import 'package:flutter_fyp/controller/delivery_address_controller.dart';
import 'package:flutter_fyp/controller/user_detail_controller.dart';
import 'package:flutter_fyp/view/global/global.dart' as globals;
import 'package:flutter_fyp/view/login/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("User Profile"),
          backgroundColor: AppColors.primarycolor,
          leading: crossButton(context),
        ),
        body: Obx(
          () => up.loading.value
              ? const Center(child: CupertinoActivityIndicator())
              : up.userDetail.value.email!.isEmpty
                  ? const Center(
                      child: Text("User email not found"),
                    )
                  : up.userDetail.value.name!.isEmpty
                      ? const Center(
                          child: Text("User name not found"),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  // color: AppColors.borderColor,
                                  shadowColor: AppColors.txtColor,
                                  child: ListTile(
                                    // onTap: () {
                                    //   Navigator.popAndPushNamed(context, route);
                                    // },
                                    leading: FaIcon(
                                      Icons.person,
                                      size: 20, color: AppColors.primarycolor,
                                    ),
                                    title: Text(
                                      up.userDetail.value.name.toString().toUpperCase(),
                                      style: TextStyle(color: AppColors.primarycolor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  // color: AppColors.borderColor,
                                  shadowColor: AppColors.txtColor,
                                  child: ListTile(
                                    // onTap: () {
                                    //   Navigator.popAndPushNamed(context, route);
                                    // },
                                    leading: FaIcon(
                                      Icons.mail_outline_rounded,
                                      size: 20,
                                      color: AppColors.primarycolor
                                    ),
                                    title: Text(
                                      up.userDetail.value.email.toString(),
                                      style: TextStyle(color: AppColors.primarycolor)
                                    ),
                                  ),
                                ),
                              ),
                              Divider(),
                              Text("Delivery Addresses"),
                              // Text(up.userDetail.value.email.toString()),
                              // Text(up.userDetail.value.name.toString()),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                // gridDelegate:
                                //     const SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 1,
                                //   // crossAxisSpacing: 5.0,
                                //   // mainAxisSpacing: 5.0,
                                // ),
                                shrinkWrap: true,
                                itemCount: da.delAddress.value.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var mydata = da.delAddress.value.data[index];
                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.pin_drop, color: AppColors.primarycolor),
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Text(mydata.region!.toUpperCase()),
                                            ),
                                            subtitle: Text(mydata.city!.toUpperCase()
                                            // +
                                                // ", " +
                                                // mydata.area! +
                                                // ", " +
                                                // mydata.address!),
                                            ),
                                            trailing: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        AppColors.primarycolor),
                                              ),
                                              child: Text(
                                                  
                                                      "Set as Delivery Address", style: TextStyle(color: Colors.white),),
                                              onPressed: () {
                                                globals.region = mydata.region!;
                                                globals.city = mydata.city!;
                                                globals.area = mydata.area!;
                                                globals.address =
                                                    mydata.address!;

                                                successMessage(
                                                    "Delivery address chosen!");
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
        ));
  }
}
