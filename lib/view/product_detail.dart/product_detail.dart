import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/api/api.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/average_rating_controller.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/user_detail_controller.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/cart/second_cart.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
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
    var pd = Get.find<ProductDetailController>();
    var ud = Get.find<UserDetailController>();
    var ci = Get.find<CartController>();
    var avrt = Get.find<AverageRatingController>();
    print('object');
    // print(avrt.productRating.value.averageRating);
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        leading: crossButton(context),
        backgroundColor: AppColors.primarycolor,
        title: const Text("Detail"),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.close),
        // ),
      ),
      body: Obx(
        () => pd.loading.value
            ? const Center(child: CupertinoActivityIndicator())
            : pd.productDetail.value.data.isEmpty
                ? const Center(
                    child: Text("Product Details not available"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //     children: [
                        //       Expanded(
                        //         flex: 2,
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Text(
                        //             "Resturants",
                        //             style: TextStyle(
                        //                 fontWeight: FontWeight.bold, fontSize: 17),
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         flex: 2,
                        //         child: BAPTText(text: rstl.restaurants.value.data.restaurantCategoryId.toString())
                        //       ),
                        //     ],
                        //   ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: pd.productDetail.value.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var mydata = pd.productDetail.value.data[index];
                                var mydata2 = ud.userDetail.value;
                                //   return  GFCard(
                                //   boxFit: BoxFit.cover,
                                //   // image: Image(image: NetworkImage(mydata.image.toString())),
                                //   title: GFListTile(

                                //     avatar: GFAvatar(
                                //       backgroundImage: AssetImage('your asset image'),
                                //     ),
                                //     title: Text('Card Title'),
                                //     subTitle: Text('Card Sub Title'),
                                //   ),
                                //   content: Image.network(mydata.image.toString()),
                                //   buttonBar: GFButtonBar(
                                //     children: <Widget>[
                                //       GFButton(
                                //         onPressed: () {},
                                //         text: 'Buy',
                                //       ),
                                //       GFButton(
                                //         onPressed: () {},
                                //         text: 'Cancel',
                                //       ),
                                //     ],
                                //   ),
                                // );

                                return Stack(children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: InkWell(
                                            onTap: () {
                                              // Navigator.pushNamed(
                                              //     context, 'restaurantDetails');
                                              // rsfcl.getRestaurantFoodCategoryList(rstl
                                              //     .restaurants.value.data[index].userId);
                                              // print(rstl.restaurants.value.data[index].id);
                                              // Get.to(() => const ResturantPage());
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    mydata.name
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),

                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 200,
                                                    // color: Colors.red,
                                                    child: GFImageOverlay(
                                                      height: 200,
                                                      width: 200,
                                                      image: NetworkImage(
                                                        mydata.picture
                                                            .toString(),
                                                      ),
                                                    )

                                                    // ClipRRect(
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(8.0),
                                                    //   clipBehavior: Clip.antiAlias,
                                                    //   child:
                                                    //   Container(
                                                    //     height: 250,
                                                    //     child: Image.network(
                                                    //       mydata.picture.toString(),
                                                    //       fit: BoxFit.cover,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    // Image.network(mydata.image,
                                                    //     fit: BoxFit.cover),
                                                    // Text(ud.userDetail.value.name
                                                    //     .toString())
                                                    // Image.network("https://www.pexels.com/photo/cooked-food-704569/"),
                                                    ),
                                                // -------------------------------------------------------------------------------------------------
                                                // Container(
                                                //   child: ListTile(
                                                //     leading: Text("Rs." +
                                                //         mydata.sp.toString()),
                                                //     trailing: Text(
                                                //         "Average Rating: " +
                                                //             avrt
                                                //                 .productRating
                                                //                 .value
                                                //                 .averageRating
                                                //                 .toString()),
                                                //   ),
                                                // ),

                                                // ----------
                                                // ListTile(
                                                //   // title: Text(rstl
                                                //   //     .restaurants.value.data[index].name
                                                //   //     .toString()),
                                                //   title: GText(
                                                //       text: mydata.name.toString(),
                                                //       fontSize: 18,
                                                //       fontWeight: FontWeight.bold),
                                                //   subtitle: GText(
                                                //     text: mydata.price.toString(),
                                                //     fontWeight: FontWeight.w300,
                                                //   ),
                                                //   // trailing: Icon(Icons.restaurant,
                                                //   //     color: Colors.black),
                                                // ),
                                                // Text( avrt.productRating.value.averageRating.toString()),

                                                // Padding(
                                                //   padding: const EdgeInsets.only(left: 10),
                                                //   child: RatingBar.builder(
                                                //     updateOnDrag: false,
                                                //     ignoreGestures: true,
                                                //     itemSize: 20,
                                                //     initialRating: 3.5,
                                                //     // initialRating: 4,
                                                //     minRating: 1,
                                                //     direction: Axis.horizontal,
                                                //     allowHalfRating: true,
                                                //     itemCount: 5,
                                                //     itemPadding: const EdgeInsets.symmetric(
                                                //         horizontal: 2.0),
                                                //     itemBuilder: (context, _) => const Icon(
                                                //       Icons.star,
                                                //       color: Colors.amber,
                                                //     ),
                                                //     onRatingUpdate: (rating) {
                                                //       print(rating);
                                                //     },
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(),

                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Price",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                                    mydata.price!.toString(), style: TextStyle(
                                                      color: Colors.red,
                                                      decoration: TextDecoration.lineThrough
                                                    ),)),
                                            const Spacer(),
                                            // Expanded(
                                            //     child: Text(mydata.discount!
                                            //             .toString() +
                                            //         ' %')),
                                            const Spacer(),
                                            Expanded(
                                                child:
                                                    Text(mydata.sp!.toString()))
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     const Spacer(),
                                        //     Expanded(
                                        //         child: Text(
                                        //             mydata.price!.toString())),
                                        //     const Spacer(),
                                        //     Expanded(
                                        //         child: Text(mydata.discount!
                                        //                 .toString() +
                                        //             ' %')),
                                        //     const Spacer(),
                                        //     Expanded(
                                        //         child:
                                        //             Text(mydata.sp!.toString()))
                                        //   ],
                                        // ),

                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Quantity",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    decreaseQuantityValue();
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove_circle,
                                                  )),
                                            ),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              // radius: const BorderRadius.all(Radius.circular(10)),
                                              child: Text(
                                                quantity.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                        // color: primaryColor,
                                                        color: AppColors
                                                            .primarycolor),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  increaseQuantityValue();
                                                },
                                                icon: const Icon(
                                                    Icons.add_circle)),
                                            const Spacer(),
                                            // MaterialButton(
                                            //   color: Colors.orange,
                                            //   onPressed: () async {
                                            //     Map data = {
                                            //       "name": mydata.name,
                                            //       "sp": mydata.sp,
                                            //       "quantity": quantity,
                                            //       // "user_id": ud.userDetail.value.id,
                                            //       "product_id": mydata.id,
                                            //       "picture": mydata.picture,
                                            //     };

                                            //     print(data);
                                            //     // var response =
                                            //     //     await RemoteService.postData(data, 'cart');

                                            //     await RemoteService.postData('cart', data);
                                            //   },
                                            //   child: GText(
                                            //     text: "Add To Cart".toUpperCase(),
                                            //     color: AppColors.primarycolor,
                                            //   ),
                                            // )
                                          ],
                                        ),

                                        Container(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: MaterialButton(
                                                        color: AppColors
                                                            .primarycolor,
                                                        onPressed: () async {
                                                          Map data = {
                                                            "name": mydata.name,
                                                            "sp": mydata.sp,
                                                            "quantity":
                                                                quantity,
                                                            // "user_id": ud.userDetail.value.id,
                                                            "product_id":
                                                                mydata.id,
                                                            "picture":
                                                                mydata.picture,
                                                          };

                                                          print(data);
                                                          // var response =
                                                          //     await RemoteService.postData(data, 'cart');

                                                          await RemoteService
                                                              .postData(
                                                                  'cart', data);
                                                        },
                                                        child: GText(
                                                          text: "Add To Cart"
                                                              .toUpperCase(),
                                                          color: AppColors
                                                              .whitecolor,
                                                        ),
                                                      )
                                                      //  ElevatedButton(
                                                      //     style: ButtonStyle(
                                                      //       backgroundColor:
                                                      //           MaterialStateProperty.all<Color>(
                                                      //               AppColors.primarycolor),
                                                      //     ),
                                                      //     onPressed: () {},
                                                      //     child: const Text("ADD TO CARD")),
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: ClipRRect(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      AppColors
                                                                          .primarycolor),
                                                        ),
                                                        onPressed: () async {
                                                          Map data = {
                                                            "name": mydata.name,
                                                            "sp": mydata.sp,
                                                            // "user_id": ud.userDetail.value.id,
                                                            "product_id":
                                                                mydata.id,
                                                            "picture":
                                                                mydata.picture,
                                                          };

                                                          print(data);
                                                          // var response =
                                                          //     await RemoteService.postData(data, 'cart');

                                                          await RemoteService
                                                              .postData(
                                                                  'wishlist',
                                                                  data);
                                                        },
                                                        child: Icon(
                                                            FontAwesomeIcons
                                                                .heart)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Text(
                                          mydata.description.toString(),
                                          style: TextStyle(),
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.visible,
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),

                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Center(
                                                child: Text(
                                              'Reviews:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )),
                                            // ---------------------
                                            // ListTile(
                                            //   // leading: Text("Average Ratings:"),
                                            //   subtitle: IgnorePointer(
                                            //     child: RatingBar.builder(
                                            //       updateOnDrag: false,
                                            //       // initialRating: avrt.productRating.value.averageRating!,
                                            //       initialRating: 2,
                                            //       minRating: 1,
                                            //       direction: Axis.horizontal,
                                            //       allowHalfRating: true,
                                            //       itemCount: 5,
                                            //       itemPadding:
                                            //           EdgeInsets.symmetric(
                                            //               horizontal: 4.0),
                                            //       itemBuilder: (context, _) =>
                                            //           Icon(
                                            //         Icons.star,
                                            //         color: Colors.amber,
                                            //       ),
                                            //       onRatingUpdate: (rating) {
                                            //         print(rating);
                                            //       },
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),

// this is for reiews====================================================
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: avrt.productRating.value
                                              .reviews.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            var mydata = avrt.productRating
                                                .value.reviews[index];
                                            return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30)),
                                                  child: Card(
                                                    elevation: 0,
                                                    shadowColor: Colors.white,
                                                    child: ListTile(
                                                        tileColor:
                                                            Colors.grey[200],
                                                        leading: GText(
                                                            text: mydata.userId
                                                                .toString(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        title: GText(
                                                            text: mydata.review
                                                                .toString())),
                                                  ),
                                                ));
                                          },
                                        ),

                                        // SingleChildScrollView(
                                        //   child: ExpansionTile(
                                        //     initiallyExpanded: true,
                                        //     title: GText(
                                        //       text: "Short Description",
                                        //       fontWeight: FontWeight.bold,
                                        //       fontSize: 18,
                                        //     ),
                                        //     children: [
                                        //       Row(
                                        //         // children: [Html(data: data.product.product.shortDescription)],
                                        //         children: [Text(mydata.description.toString(), style: TextStyle(),textAlign: TextAlign.justify, overflow: TextOverflow.visible,),],
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),

                                        Divider(),
                                      ],
                                    ),
                                  ),

                                  // Positioned(
                                  //   top: 110,
                                  //   right: 20,
                                  //   child: Container(
                                  //     width: 60,
                                  //     height: 60,
                                  //     decoration: const BoxDecoration(
                                  //       color: AppColors.secondaryText,
                                  //       shape: BoxShape.circle,
                                  //       boxShadow: [
                                  //         // color: Colors.white, //background color of box
                                  //         BoxShadow(
                                  //           color: Colors.black,
                                  //           blurRadius: 6.0, // soften the shadow
                                  //           spreadRadius: 0, //extend the shadow
                                  //           offset: Offset(
                                  //             0, // Move to right 10  horizontally
                                  //             0, // Move to bottom 10 Vertically
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     child: const Icon(Icons.restaurant),
                                  //   ),
                                  // ),
                                ]);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
