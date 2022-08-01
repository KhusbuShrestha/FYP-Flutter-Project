import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/about_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var abt = Get.find<AboutController>();
    print(abt);
    print(abt.aboutList);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          centerTitle: true,
          leading: crossButton(context),
          title: const Text(
            "About US",
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
                  FontAwesomeIcons.infoCircle,
                  color: Colors.black,
                ),
                title: Text(
                  "ABOUT US",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.blackColor),
                ),
              ),

              const Divider(),
              // Card(child: Text("Ghardhailo the ultimate Nepali mobile application that offers a solution for all needs of the customers. It has a wide and assorted range of products including all hand made products", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),),
              // Card(
              //   child: Column(children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       // child: Text("Your About Us page is a wonderful way to show your visitors who you are and provide them the confidence that you and your organization have the skills and expertise they need to solve their issues. Your About Us page is where you create that first intimate bond with your prospective client", textAlign: TextAlign.justify,),
              //       child: Text(abt.aboutList.toString(), textAlign: TextAlign.justify,),
              //     )
              //   ],),
              // ),
              
             

              Card(
                // color: Color.fromRGBO(144, 130, 130, 1),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: abt.aboutList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        // Container(
                        //   height: 200,
                        //   color: Colors.black,
                        // ),
                        // Text(cat.categoryList[index].id.toString(), style: TextStyle(color: Colors.black),),
                        Text(
                          abt.aboutList[index].description.toString(), textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black, ),
                        ),
                      ],
                    );
                    // return categoryButton(context, 'cart', cat.categoryList[index].name.toString());
                  },
                ),
              ),
              // Flexible(
              //   child: FlutterMap(
              //     options: MapOptions(
              //         maxZoom: 21.0,
              //         center: LatLng(27.7172, 85.3240),
              //         // bounds: LatLngBounds(LatLng(29.9711, 29.9711), LatLng(29.9711, 88.0803)),
              //         zoom: 5.6),
              //     layers: [
              //       TileLayerOptions(
              //         retinaMode: false,
              //         urlTemplate:
              //             "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              //         subdomains: ['a', 'b', 'c'],
              //       ),
              //       MarkerLayerOptions(markers: [
              //         Marker(
              //             // point: LatLng(26.815674, 87.263948),
              //             point: LatLng(26.817868, 87.270098),
              //             builder: (context) =>
              //                 // const Icon(
              //                 //     Icons.person_pin_circle_outlined,
              //                 //     size: 40,
              //                 //     color: Colors.red),
              //                 Column(
              //                   children: [
              //                     const Flexible(
              //                       flex: 8,
              //                       child: Icon(
              //                         Icons.pin_drop,
              //                         color: Colors.red,
              //                         // size: 15.0,
              //                         // textDirection: hospitalDetails['hospitalName']!,
              //                       ),
              //                     ),
              //                     Flexible(
              //                       fit: FlexFit.loose,
              //                       flex: 1,
              //                       child: GText(
              //                         text: "Ghar Dailo",
              //                         color: Colors.black,
              //                         fontSize: 7,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ],
              //                 ))
              //       ]),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
