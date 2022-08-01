import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cards.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/average_rating_controller.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/product_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
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

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;

  String get jsonString => 'String';

  increaseQuantityValue() {
    setState(() {
      quantity++;
    });
  }

  decreaseQuantityValue() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final CartController = Get.put(CartController());
    var pd = Get.find<ProductDetailController>();
    double _rating = 3;
    int total = 1;
    var prd = Get.find<ProductController>();
    var avrt = Get.find<AverageRatingController>();

    return SafeArea(
        child: Scaffold(
      // drawer: const MyDrawer(),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: AppColors.primarycolor,
      //   title: const Text(
      //     'Product',
      //     style: TextStyle(color: AppColors.whitecolor),
      //   ),

      // ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: AppColors.primarycolor,
      //   title: const Text(
      //     'Product',
      //     style: TextStyle(color: AppColors.whitecolor),
      //   ),
      //   actions: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         IconButton(
      //             onPressed: () {
      //               Get.to(() => SearchPage());
      //             },
      //             icon: Icon(Icons.search)),
      //         Stack(
      //           children: [
      //             IconButton(
      //               onPressed: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => CartPage()));
      //               },
      //               icon: Icon(Icons.shopping_cart),
      //             ),
      //           ],
      //         ),
      //       ],
      //     )
      //   ],
      // ),
      body: Obx(
        () => prd.loading.value
            ? const Center(child: CupertinoActivityIndicator())
            : prd.productList.value.data.isEmpty
                ? const Center(
                    child: Text("Products not added"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const Divider(),

                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: prd.productList.value.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var mydata = prd.productList.value.data[index];

                              // var mydata = wc.wishlistItems.value.data[index];
                              return SingleChildScrollView(
                                child: InkWell(
                                  onTap: () {
                                    print('object');
                                    // Get.to(() => const ProductProfile());
                                    pd.getProductDetail(mydata.id!);
                                    avrt.getAverageRating(mydata.id!);
                                    // pd.getProductDetail(data.product!);
                                    Get.to(() => const ProductDetailPage());
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
                                          image: NetworkImage(prd.productList
                                              .value.data[index].picture
                                              .toString()),
                                        ),
                                        title: Column(
                                          children: [
                                            Text(
                                              prd.productList.value.data[index]
                                                  .name
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
                                                mydata.price.toString()),
                                            // Text(mydata.price.toString())
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

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                mydata.discount == null
                                                    ? SizedBox()
                                                    : Container(
                                                        child: ListTile(
                                                        title: Text(
                                                          "Save upto " +
                                                              mydata.discount
                                                                  .toString() +
                                                              "%",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 16),
                                                        ),
                                                        subtitle: Text("New Price\n Rs."+mydata.sp.toString()),
                                                      )),
                                              ],
                                            ),

                                         
                                          ],
                                        )),
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
                                                "name": mydata.name,
                                                "sp": mydata.sp,
                                                // "user_id": ud.userDetail.value.id,
                                                "product_id": mydata.id,
                                                "picture": mydata.picture,
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
