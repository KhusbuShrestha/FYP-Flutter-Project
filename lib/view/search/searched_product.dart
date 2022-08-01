import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cards.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/average_rating_controller.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/product_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/controller/search_controller.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:flutter_fyp/view/product_detail.dart/product_detail.dart';
import 'package:flutter_fyp/view/product_profile/product_profile.dart';
import 'package:flutter_fyp/view/search/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchedProductPage extends StatelessWidget {
  const SearchedProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CartController = Get.put(CartController());
    double _rating = 3;
    int total = 1;
    var prd = Get.find<SearchController>();
    var newplc = Get.find<ProductListController>();
    var pd = Get.find<ProductDetailController>();
    var avrt = Get.find<AverageRatingController>();

    print(prd);
    return SafeArea(
      child: Scaffold(
        // drawer: const MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          leading: crossButton(context),
          backgroundColor: AppColors.primarycolor,
          title: const Text(
            'Searched',
            style: TextStyle(color: AppColors.whitecolor),
          ),
          // actions: [
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       IconButton(
          //           onPressed: () {
          //             Get.to(() => SearchPage());
          //           },
          //           icon: Icon(Icons.search)),
          //       Stack(
          //         children: [
          //           IconButton(
          //             onPressed: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => CartPage()));
          //             },
          //             icon: Icon(Icons.shopping_cart),
          //           ),
          //         ],
          //       ),
          //     ],
          //   )
          // ],
        ),
        body: Obx(
          () => prd.search.value.data.isEmpty
              ? const Center(
                  child: Text("Products not available"),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: prd.search.value.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = prd.search.value.data[index];
                            // var mydata = newplc.productList.value.data[index];
                            return SingleChildScrollView(
                              child: InkWell(
                                onTap: () {
                                  // print('object');
                                  // Get.to(() => const ProductProfile());
                                    avrt.getAverageRating(data.id!);

                                  pd.getProductDetail(data.id!);
                                  Get.to(() => const ProductDetailPage());
                                },
                                child: GFCard(
                                  boxFit: BoxFit.cover,
                                  image: Image.network(prd
                                      .search.value.data[index].picture
                                      .toString()),
                                  title: GFListTile(
                                      avatar: GFImageOverlay(
                                        height: 120,
                                        width: 120,
                                        image: NetworkImage(prd
                                            .search.value.data[index].picture
                                            .toString()),
                                      ),
                                      title: Column(
                                        children: [
                                          Text(
                                            prd.search.value.data[index].name
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      subTitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Rs. ' + data.sp.toString()),
                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                data.discount == null
                                                    ? SizedBox()
                                                    : Container(
                                                        child: ListTile(
                                                        title: Text(
                                                          "Save upto " +
                                                              data.discount
                                                                  .toString() +
                                                              "%",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 16),
                                                        ),
                                                        subtitle: Text("New Price\n Rs."+data.sp.toString()),
                                                      )),
                                              ],
                                            ),

                                          // RatingBar.builder(
                                          //   updateOnDrag: false,
                                          //   ignoreGestures: true,
                                          //   itemSize: 20,
                                          //   initialRating: 3.5,
                                          //   // initialRating: 4,
                                          //   minRating: 1,
                                          //   direction: Axis.horizontal,
                                          //   allowHalfRating: true,
                                          //   itemCount: 5,
                                          //   itemPadding:
                                          //       const EdgeInsets.symmetric(
                                          //           horizontal: 2.0),
                                          //   itemBuilder: (context, _) =>
                                          //       const Icon(
                                          //     Icons.star,
                                          //     color: Colors.amber,
                                          //   ),
                                          //   onRatingUpdate: (rating) {
                                          //     print(rating);
                                          //   },
                                          // ),
                                          //     Container(
                                          //   child: Row(
                                          //     children: [
                                          //       IconButton(
                                          //           icon: Icon(Icons.remove_circle),
                                          //           onPressed: () {
                                          //             total--;
                                          //             if (total <= 1) {
                                          //               total = 1;
                                          //             }
                                          //             // setState(() {});
                                          //           }),
                                          //       Text('$total'),
                                          //       IconButton(
                                          //           icon: Icon(Icons.add_circle),
                                          //           onPressed: () {
                                          //             total++;
                                          //             // setState(() {});
                                          //           }),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      )),
                                  content: Column(
                                    children: [],
                                  ),
                                  // buttonBar:
                                  //  GFButtonBar(
                                  //   children: <Widget>[
                                  //     GFButton(
                                  //       icon: Icon(
                                  //         Icons.shopping_cart,
                                  //         color: Colors.white,
                                  //       ),
                                  //       onPressed: () {},
                                  //       text: 'Add to card',
                                  //       color: AppColors.primarycolor,
                                  //     ),
                                  //     GFButton(
                                  //       color: AppColors.primarycolor,
                                  //       icon: Icon(
                                  //         FontAwesomeIcons.heart,
                                  //         color: Colors.white,
                                  //       ),
                                  //       onPressed: () {
                                  //         print('object');
                                  //       },
                                  //       text: 'Add to wihlist',
                                  //     ),
                                  //   ],
                                  // ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
