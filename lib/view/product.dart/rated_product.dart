import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cards.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/product_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/rating_controller.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:flutter_fyp/view/product_detail.dart/product_detail.dart';
import 'package:flutter_fyp/view/product_profile/product_profile.dart';
import 'package:flutter_fyp/view/search/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatedProductPage extends StatelessWidget {
  const RatedProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CartController = Get.put(CartController());
    var rpd = Get.find<RatingController>();
    double _rating = 3;
    int total = 1;
    // var prd = Get.find<ProductController>();
    return SafeArea(
        child: Scaffold(
      drawer: const MyDrawer(),
      body: Obx(
        () => rpd.loading.value
            ? const Center(child: CupertinoActivityIndicator())
            : rpd.ratedProduct.value.data.isEmpty
                ? const Center(
                    child: Text("Rated products are not available"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: rpd.ratedProduct.value.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var mydata = rpd.ratedProduct.value.data[index];
                              // var mydata = wc.wishlistItems.value.data[index];
                              return SingleChildScrollView(
                                child: InkWell(
                                  onTap: () {
                                    // print('object');
                                    // Get.to(() => const ProductProfile());
                                    // pd.getProductDetail(data.id);
                                    // pd.getProductDetail(data.product!);
                                    Get.to(() => const ProductDetailPage());
                                  },
                                  child: GFCard(
                                    boxFit: BoxFit.cover,
                                    image:
                                        Image.network(mydata.image.toString()),
                                    title: GFListTile(
                                        avatar: GFImageOverlay(
                                          height: 120,
                                          width: 120,
                                          image: NetworkImage(
                                              mydata.image.toString()),
                                        ),
                                        title: Column(
                                          children: [
                                            Text(
                                              mydata.product
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
                                            Text('Rs. ' +
                                                mydata.sellingPrice.toString()),
                                            RatingBar.builder(
                                              updateOnDrag: false,
                                              ignoreGestures: true,
                                              itemSize: 20,
                                              initialRating: mydata.rating!,
                                              // initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            // Container(
                                            //   child: Row(
                                            //     children: [
                                            //       IconButton(
                                            //           icon: Icon(
                                            //               Icons.remove_circle),
                                            //           onPressed: () {
                                            //             total--;
                                            //             if (total <= 1) {
                                            //               total = 1;
                                            //             }
                                            //             // setState(() {});
                                            //           }),
                                            //       Text('$total'),
                                            //       IconButton(
                                            //           icon: Icon(
                                            //               Icons.add_circle),
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
                                    buttonBar: GFButtonBar(
                                      children: <Widget>[
                                        // GFButton(
                                        //   icon: Icon(
                                        //     Icons.shopping_cart,
                                        //     color: Colors.white,
                                        //   ),
                                        //   onPressed: ()async {
                                        //                 Map data = {
                                        //                   "name": mydata.name,
                                        //                   "sp": mydata.sp,
                                        //                   "quantity": quantity,
                                        //                   // "user_id": ud.userDetail.value.id,
                                        //                   "product_id":
                                        //                       mydata.id,
                                        //                   "picture":
                                        //                       mydata.picture,
                                        //                 };

                                        //                 print(data);
                                        //                 // var response =
                                        //                 //     await RemoteService.postData(data, 'cart');

                                        //                 await RemoteService
                                        //                     .postData(
                                        //                         'cart', data);
                                        //               },
                                        //   text: 'Add to card',
                                        //   color: AppColors.primarycolor,
                                        // ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: GFButton(
                                            color: AppColors.primarycolor,
                                            icon: Icon(
                                              FontAwesomeIcons.heart,
                                              color: Colors.white,
                                            ),
                                            onPressed: () async {
                                              Map data = {
                                                "name": mydata.product,
                                                "sp": mydata.sellingPrice,
                                                // "user_id": ud.userDetail.value.id,
                                                "product_id": mydata.id,
                                                "picture": mydata.image,
                                              };

                                              print(data);
                                              // var response =
                                              //     await RemoteService.postData(data, 'cart');

                                              await RemoteService.postData(
                                                  'wishlist', data);
                                            },
                                            text: 'Add to wihlist',
                                          ),
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
    ));
  }
}
