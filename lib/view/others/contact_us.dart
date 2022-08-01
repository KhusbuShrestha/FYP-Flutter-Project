import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/contact_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ContactUSPage extends StatelessWidget {
  const ContactUSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cont = Get.find<ContactController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          centerTitle: true,
          leading: crossButton(context),
          title: const Text(
            "CONTACT US",
            style: TextStyle(color: AppColors.whitecolor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              const ListTile(
                leading: Icon(
                  FontAwesomeIcons.addressCard,
                  color: Colors.black,
                ),
                title: Text(
                  "CONTACT US",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.blackColor),
                ),
              ),
              const Divider(),
              // Card(
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: const Text(
              //           "Your About Us page is a wonderful way to show your visitors who you are and provide them the confidence that you and your organization have the skills and expertise they need to solve their issues. Your About Us page is where you create that first intimate bond with your prospective client",
              //           textAlign: TextAlign.justify,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Card(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cont.contactList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        // Container(
                        //   height: 200,
                        //   color: Colors.black,
                        // ),
                        // Text(cat.categoryList[index].id.toString(), style: TextStyle(color: Colors.black),),
                        Card(
                          child: ListTile(
                              leading: Text('Email'),
                              trailing: Text(
                                cont.contactList[index].email.toString(),
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Card(
                          child: ListTile(
                              leading: Text('Number'),
                              trailing: Text(
                                cont.contactList[index].number.toString(),
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Card(
                          child: ListTile(
                              leading: Text('Address'),
                              trailing: Text(
                                cont.contactList[index].address.toString(),
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    );
                    // return categoryButton(context, 'cart', cat.categoryList[index].name.toString());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
