import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/team_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OurTeamPage extends StatelessWidget {
  const OurTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tem = Get.find<TeamController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          centerTitle: true,
          leading: crossButton(context),
          title: const Text(
            "Our Team",
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
                  FontAwesomeIcons.users,
                  color: Colors.black,
                ),
                title: Text(
                  "OUR TEAM",
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
              ListView.builder(
                  shrinkWrap: true,

                  itemCount: tem.teamList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        // Container(
                        //   height: 200,
                        //   color: Colors.black,
                        // ),
                        // Text(cat.categoryList[index].id.toString(), style: TextStyle(color: Colors.black),),
                        Text(tem.teamList[index].description.toString(), style: TextStyle(color: Colors.black),),
                      ],
                    );
                    // return categoryButton(context, 'cart', cat.categoryList[index].name.toString());
                  },)
            ],
          ),
        ),
      ),
    );
  }
}
