import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cards.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/product_controller.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:flutter_fyp/view/product_profile/product_profile.dart';
import 'package:flutter_fyp/view/search/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DescendingPage extends StatelessWidget {
  const DescendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CartController = Get.put(CartController());
    double _rating = 3;
    int total = 1;
    var prd = Get.find<ProductController>();
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return Container(
                            height: 350,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GText(
                                  text: "FILTER",
                                  fontWeight: FontWeight.bold,
                                ),
                                Text('price'),
                                // sort("position", "Position Low to High"),
                                // // sort("position", "Position High to Low"),
                                // sort("name", "Product Name A to Z"),
                                // // sort("name", "Product Name Z to A"),
                                // sort("price", "Price Low to High"),
                                // // sort("price", "Price High to Low"),
                              ],
                            ),
                          );
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.filter_alt_outlined),
                              Text("Filter")
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (builder) {
                                    return Container(
                                      height: 350,
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GText(
                                            text: "FILTER",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          // Text('price'),
                                          // sort("position", "Position Low to High"),
                                          // // sort("position", "Position High to Low"),
                                          // sort("name", "Product Name A to Z"),
                                          // // sort("name", "Product Name Z to A"),
                                          // sort("price", "Price Low to High"),
                                          // // sort("price", "Price High to Low"),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Row(
                              children: [
                                Icon(Icons.sort_rounded),
                                Text("Sort")
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: (){
                      //       Navigator.popAndPushNamed(context, 'cart');
                      //     },
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         children: [
                      //           Icon(Icons.grid_view_outlined),
                      //           Text("Grid")
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              const Divider(),
             
              Card(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 3.0),
                  itemCount: prd.productList.value.data.length,
                  itemBuilder: (context, index) {
                    var mydata = prd.productList.value.data[index];
                    return InkWell(
                      onTap: () {
                        Get.to(() => const ProductProfile());
                      },
                      child: Center(
                        child: Column(
                          children: [
                            // Text(
                            //   mydata.name.toString(),
                            //   style: TextStyle(color: Colors.black),
                            // ),
                            // Text(mydata.price.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: prd.productList.value.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = prd.productList.value.data[index];
                    return SingleChildScrollView(
                      child: InkWell(
                        onTap: () {
                          print('object');
                          Get.to(() => const ProductProfile());
                        },
                        child: GFCard(
                          boxFit: BoxFit.cover,
                          image: Image.network(prd
                              .productList.value.data[index].picture
                              .toString()),
                          title: GFListTile(
                              avatar: GFImageOverlay(
                                height: 120,
                                width: 120,
                                image: NetworkImage(prd
                                    .productList.value.data[index].picture
                                    .toString()),
                              ),
                              title: Column(
                                children: [
                                  Text(
                                    prd.productList.value.data[index].name
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              subTitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rs. ' + data.sp.toString()),
                                  RatingBar.builder(
                                    updateOnDrag: false,
                                    ignoreGestures: true,
                                    itemSize: 20,
                                    initialRating: 3.5,
                                    // initialRating: 4,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.remove_circle),
                                            onPressed: () {
                                              total--;
                                              if (total <= 1) {
                                                total = 1;
                                              }
                                              // setState(() {});
                                            }),
                                        Text('$total'),
                                        IconButton(
                                            icon: Icon(Icons.add_circle),
                                            onPressed: () {
                                              total++;
                                              // setState(() {});
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          content: Column(
                            children: [],
                          ),
                          buttonBar: GFButtonBar(
                            children: <Widget>[
                              GFButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                                text: 'Add to card',
                                color: AppColors.primarycolor,
                              ),
                              GFButton(
                                color: AppColors.primarycolor,
                                icon: Icon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  print('object');
                                },
                                text: 'Add to wihlist',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
