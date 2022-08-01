
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/average_rating_controller.dart';
import 'package:flutter_fyp/controller/descending_controller.dart';
import 'package:flutter_fyp/controller/increasing_controller.dart';
import 'package:flutter_fyp/controller/order_desc_controller.dart';
import 'package:flutter_fyp/controller/product_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/product_list_category_Controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:flutter_fyp/view/product_detail.dart/product_detail.dart';
import 'package:flutter_fyp/view/product_list_category/asc_product.dart';
import 'package:flutter_fyp/view/product_list_category/desc_product.dart';
import 'package:flutter_fyp/view/product_profile/product_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_fyp/view/global/global.dart' as globals;
import 'package:getwidget/getwidget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductListCategory extends StatelessWidget {
  const ProductListCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _rating = 3;
    int total = 1;
    var prd = Get.find<ProductController>();
    var newplc = Get.find<ProductListController>();
    var pd = Get.find<ProductDetailController>();
    var avrt = Get.find<AverageRatingController>();
    var desc = Get.find<DecreaseController>();
    var asc = Get.find<IncreaseController>();
    List<String> sortBy = ['Desc', 'Asc'];
    return Scaffold(
      appBar: AppBar(
        leading: crossButton(context),
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: AppColors.primarycolor,
      ),
      body: Obx(
        () => newplc.loading.value
            ? const Center(child: CupertinoActivityIndicator())
            : newplc.productList.value.data.isEmpty
                ? const Center(
                    child: Text("Products not added"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text('Sort By:')),
                            Expanded(
                              flex: 2,
                              child: DropdownButton<String>(
                                // value: category,
                                isExpanded: true,
                                items: sortBy.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  // incomeCategory = value;
                                  // print(value);
                                  // setState(() {});

                                  // dp.getDecPriceFood(globals.category_id);
                                  
                                  if (value == "Desc") {
                                    desc.getDecreaseProductList(globals.category_id);
                                    Get.off(() => const DescProductPage());
                                    print(desc.getDecreaseProductList(globals.category_id));
                                    print("glb");
                                    print(globals.category_id);
                                  } else if (value == "Asc") {
                                    asc.getIncreaseProductList(globals.category_id);
                                    Get.off(() => const AscProductPage());
                                  }
                                },
                                hint: Text("Price"),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        //  ListView.builder(
                        //   shrinkWrap: true,
                        //   itemCount: newplc.productList.value.data.length,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     var mydata = newplc.productList.value.data[index];
                        //     return Card(
                        //       child: InkWell(
                        //         onTap: () {
                        //           pd.getProductDetail(mydata.id);
                        //           Get.to(() => const ProductDetailPage());
                        //         },
                        //         child: Column(
                        //           children: [
                        //             ListTile(
                        //               title: Text(
                        //                   newplc.productList.value.data[index].name),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   }),
                        /* ListView.builder(
                  shrinkWrap: true,
                  itemCount: newplc.productList.value.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mydata = newplc.productList.value.data[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          pd.getProductDetail(mydata.id);
                          Get.to(() => const ProductDetailPage());
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                  newplc.productList.value.data[index].name),
                            )
                          ],
                        ),
                      ),
                    );
                  }), */

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                              shrinkWrap: true,
                              itemCount: newplc.productList.value.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var mydata =
                                    newplc.productList.value.data[index];
                                return InkWell(
                                  onTap: () {
                                    avrt.getAverageRating(mydata.id);
                                    // fcfl.getFoodCategoryFoodList(mydata.id);
                                    // Get.to("page")
                                    print("mydata");
                                    print(mydata.id);
                                    // Get.to(() => const ProductProfile());
                                    pd.getProductDetail(mydata.id);
                                    Get.to(() => const ProductDetailPage());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Container(
                                      height: 250,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            child: Image.network(
                                              mydata.picture,
                                              fit: BoxFit.cover,
                                              height: 110,
                                              width: double.infinity,
                                            ),
                                          ),
                                          

                                          // BAPTText(text: mydata.name),
                                          // BAPTText(text: mydata.price.toString()),
                                          ListTile(
                                            title: Text(
                                              mydata.name.toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text("RS. "+mydata.price.toString()),
                                            
                                            // subtitle: RatingBar.builder(
                                            //   updateOnDrag: false,
                                            //   ignoreGestures: true,
                                            //   itemSize: 20,
                                            //   initialRating: 3.5,
                                            //   // initialRating: 4,
                                            //   minRating: 1,
                                            //   direction: Axis.horizontal,
                                            //   allowHalfRating: true,
                                            //   itemCount: 5,
                                            //   // itemPadding: const EdgeInsets.symmetric(
                                            //   //     horizontal: 2.0),
                                            //   itemBuilder: (context, _) =>
                                            //       const Icon(
                                            //     Icons.star,
                                            //     color: Colors.amber,
                                            //   ),
                                            //   onRatingUpdate: (rating) {
                                            //     print(rating);
                                            //   },
                                            // ),
                                            
                                          ),
                                          
                                          

                                          // SizedBox(
                                          //   height: 100,
                                          //   child: ListTile(
                                          //     // title: Text(rstl
                                          //     //     .restaurants.value.data[index].name
                                          //     //     .toString()),
                                          //     title: BAPTText(
                                          //         text: mydata.name
                                          //             .toString(),
                                          //         fontSize: 18,
                                          //         fontWeight: FontWeight.bold),
                                          //     subtitle: BAPTText(
                                          //       text: mydata.price
                                          //           .toString(),
                                          //       fontWeight: FontWeight.w300,
                                          //     ),
                                          //     // trailing: Icon(Icons.restaurant,
                                          //     //     color: Colors.black),
                                          //   ),
                                          // ),
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
                                );
                              }),
                        ),

                        // ListView.builder(
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     itemCount: newplc.productList.value.data.length,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       var mydata = newplc.productList.value.data[index];

                        //       // var data = prd.productList.value.data[index];
                        //       return SingleChildScrollView(
                        //         child: InkWell(
                        //           onTap: () {
                        //             // print('object');
                        //             // Get.to(() => const ProductProfile());
                        //             pd.getProductDetail(mydata.id);
                        //             Get.to(() => const ProductDetailPage());
                        //           },
                        //           child: GFCard(
                        //             boxFit: BoxFit.cover,
                        //             // image: Image.network(mydata.picture
                        //             //     .toString()),
                        //             title: GFListTile(
                        //                 avatar: GFImageOverlay(
                        //                   height: 120,
                        //                   width: 120,
                        //                   image: NetworkImage(mydata.picture.toString()),
                        //                 ),
                        //                 title: Column(
                        //                   children: [
                        //                     Text(
                        //                       mydata.name.toString().toUpperCase(),
                        //                       style: TextStyle(
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 15),
                        //                     ),
                        //                   ],
                        //                 ),
                        //                 subTitle: Column(
                        //                   mainAxisAlignment: MainAxisAlignment.start,
                        //                   crossAxisAlignment: CrossAxisAlignment.start,
                        //                   children: [
                        //                     Text('Rs. ' + mydata.sp.toString()),
                        //                     RatingBar.builder(
                        //                       updateOnDrag: false,
                        //                       ignoreGestures: true,
                        //                       itemSize: 20,
                        //                       initialRating: 3.5,
                        //                       // initialRating: 4,
                        //                       minRating: 1,
                        //                       direction: Axis.horizontal,
                        //                       allowHalfRating: true,
                        //                       itemCount: 5,
                        //                       itemPadding: const EdgeInsets.symmetric(
                        //                           horizontal: 2.0),
                        //                       itemBuilder: (context, _) => const Icon(
                        //                         Icons.star,
                        //                         color: Colors.amber,
                        //                       ),
                        //                       onRatingUpdate: (rating) {
                        //                         print(rating);
                        //                       },
                        //                     ),
                        //                     // Container(
                        //                     //   child: Row(
                        //                     //     children: [
                        //                     //       IconButton(
                        //                     //           icon: Icon(Icons.remove_circle),
                        //                     //           onPressed: () {
                        //                     //             total--;
                        //                     //             if (total <= 1) {
                        //                     //               total = 1;
                        //                     //             }
                        //                     //             // setState(() {});
                        //                     //           }),
                        //                     //       Text('$total'),
                        //                     //       IconButton(
                        //                     //           icon: Icon(Icons.add_circle),
                        //                     //           onPressed: () {
                        //                     //             total++;
                        //                     //             // setState(() {});
                        //                     //           }),
                        //                     //     ],
                        //                     //   ),
                        //                     // ),
                        //                   ],
                        //                 )),
                        //             content: Column(
                        //               children: [],
                        //             ),
                        //             // buttonBar: GFButtonBar(
                        //             //   children: <Widget>[
                        //             //     GFButton(
                        //             //       icon: Icon(
                        //             //         Icons.shopping_cart,
                        //             //         color: Colors.white,
                        //             //       ),
                        //             //       onPressed: () {},
                        //             //       text: 'Add to card',
                        //             //       color: AppColors.primarycolor,
                        //             //     ),
                        //             //     GFButton(
                        //             //       color: AppColors.primarycolor,
                        //             //       icon: Icon(
                        //             //         FontAwesomeIcons.heart,
                        //             //         color: Colors.white,
                        //             //       ),
                        //             //       onPressed: () {
                        //             //         print('object');
                        //             //       },
                        //             //       text: 'Add to wihlist',
                        //             //     ),
                        //             //   ],
                        //             // ),
                        //           ),
                        //         ),
                        //       );
                        //     }),
                      ],
                    ),
                  ),
      ),
    );
  }
}
