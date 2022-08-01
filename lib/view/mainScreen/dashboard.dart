// import 'package:flutter/material.dart';
// import 'package:flutter_fyp/const/color.dart';
// import 'package:flutter_fyp/view/drawer/drawer.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // extendBodyBehindAppBar: true,

//       drawer: const MyDrawer(),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColors.primarycolor,
//         title: Text("Dashbaord"),
//         centerTitle: true,
//         actions: [
//           Column(
//             children: [
//               //  Icon(Icons.shopping_cart_outlined)
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, 'cart');
//                 },
//                 icon: const Icon(Icons.shopping_cart_outlined),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 150,
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset(
//                 'images/file.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const Divider(),
//             Container(
//               child: Column(),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cards.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/error_message.dart';
import 'package:flutter_fyp/const/info_message.dart';
import 'package:flutter_fyp/const/success_message.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/cart_total.dart';
import 'package:flutter_fyp/controller/category_controller.dart';
import 'package:flutter_fyp/controller/product_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/product_list_category_Controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/controller/recetly_products.dart';
import 'package:flutter_fyp/controller/search_controller.dart';
import 'package:flutter_fyp/controller/top_products.dart';
import 'package:flutter_fyp/controller/user_detail_controller.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/cart/second_cart.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_fyp/view/product.dart/product.dart';
import 'package:flutter_fyp/view/product_detail.dart/product_detail.dart';
import 'package:flutter_fyp/view/product_list_category/product_list_category.dart';
import 'package:flutter_fyp/view/producttab/productpage.dart';
import 'package:flutter_fyp/view/search/searched_product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_fyp/view/global/global.dart' as globals;
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:getwidget/getwidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void show() {
    showDialog(
        context: context,
        builder: (context) {
          return RatingDialog(
              title: Text('rating'),
              submitButtonText: 'submit',
              onSubmitted: (response) {});
        });
  }

  @override
  Widget build(BuildContext context) {
    // List list = [
    //   "Flutter",
    //   "React",
    //   "Ionic",
    //   "Xamarin",
    // ];
    // final List<String> imagesList = [
    //   'https://images.pexels.com/photos/5709755/pexels-photo-5709755.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //   'https://images.pexels.com/photos/5709913/pexels-photo-5709913.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //   'https://images.pexels.com/photos/3738088/pexels-photo-3738088.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    //   'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    //   'https://images.pexels.com/photos/22823/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    // ];
    var cat = Get.find<CategoryController>();
    // UserDetailController().getUserDetail();
    var plc = Get.find<ProductListController>();
    var ud = Get.find<UserDetailController>();
    var ci = Get.find<CartController>();
    var ct = Get.find<CartTotalController>();
    var sh = Get.find<SearchController>();
    var pd = Get.find<ProductDetailController>();
    var rp = Get.find<RecentlyProductsController>();
    var tp = Get.find<TopProductsController>();
    var prd = Get.find<ProductController>();

    var rewardIcon;
    var statusColor;
    var discount;
    print("name ho hai-");
    print(ud.userDetail.value.name);
    return Scaffold(
        // extendBodyBehindAppBar: true,

        drawer: MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primarycolor,
          title: Text("Dashboard"),
          centerTitle: true,
          actions: [
            Column(
              children: [
                //  Icon(Icons.shopping_cart_outlined)
                IconButton(
                  onPressed: () {
                    // Navigator.popAndPushNamed(context, 'cart');
                    // ud.getUserDetail();
                    ci.getCartItems();
                    ct.getCartTotal();
                    // ci.getCartItems(ud.userDetail.value.id!);
                    Get.to(() => const CartPage());
                    // print(ud.userDetail.value.name);
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                )
              ],
            )
          ],
        ),
        body: Obx(
          () =>
              //  Obx(
              //() => plc.loading.value ? const Center(child: CupertinoActivityIndicator())  : plc.productList.value.data.isEmpty
              //             ? const Center(
              //                 child: Text("User email not found"),
              //               )
              //             : plc.productList.value.data.isEmpty
              //                 ? const Center(
              //                     child: Text("User name not found")) :
              SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlineSearchBar(
                    // borderRadius: const BorderRadius.all(Radius.circular(10)),
                    elevation: 10,
                    // keyboardType: TextInputType.text,
                    // backgroundColor: Colors.red,
                    hintText: "Search products",
                    // borderColor: AppSetting.primaryColor,
                    borderColor: AppColors.primarycolor,
                    borderWidth: 2,
                    searchButtonIconColor: AppColors.primarycolor,
                    clearButtonColor: AppColors.secondaryText,
                    // onTap: ,
                    onSearchButtonPressed: (value) {
                      print(value);
                      if ((value).isEmpty) {
                        errorMessage("Empty!, Please insert product name!");
                      } else {
                        sh.getSearchList(value);
                        Get.to(() => const SearchedProductPage());
                      }
                      // sr.getSearchedRes(value);
                      // Get.to(() => const SearchResult());
                    },
                  ),
                ),

                // GFCarousel(
                //   pagerSize: 6,
                //   hasPagination: true,
                //   passiveIndicator: Colors.white,
                //   activeDotBorder: Border.all(color: Colors.white),
                //   height: 150,
                //   autoPlayInterval: Duration(seconds: 3),
                //   autoPlay: true,
                //   items: rp.recentProductList.value.data.map(
                //     (e) {
                //       return Container(
                //         // decoration: BoxDecoration(
                //         //     border: Border.all(
                //         //         color: AppColors.secondaryText, width: 2)
                //         //         ),
                //         // margin: EdgeInsets.all(2.0),
                //         child: Column(
                //           children: [
                //             SizedBox(
                //               height: 126,
                //               child: ClipRRect(
                //                 borderRadius:
                //                     const BorderRadius.all(Radius.circular(2.0)),
                //                 child: Image.network(e.picture!,
                //                     fit: BoxFit.cover, width: 800.0),
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ).toList(),
                //   onPageChanged: (index) {
                //     setState(() {
                //       index;
                //     });
                //   },
                // ),
                CarouselSlider( 
                items: prd.productList.value.data 
                    .map((item) => Container( 
                      height: 50,
                          decoration: BoxDecoration( 
                          
                              image: DecorationImage( 
                                  image: NetworkImage(item.picture!), 
                                  fit: BoxFit.cover)), 
                        )) 
                    .toList(), 
                options: CarouselOptions( 
                  autoPlay: true, 
                  disableCenter: false, 
                )),


               

                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10),
                //   child: GFCarousel(
                //     pagerSize: 6,
                //     hasPagination: true,
                //     passiveIndicator: Colors.black,
                //     activeDotBorder: Border.all(color: Colors.white),
                //     height: 130,
                //     autoPlayInterval: Duration(seconds: 1),
                //     autoPlay: false,
                //     items: rp.recentProductList.value.data.map(
                //       (e) {
                //         return Container(
                //           decoration: BoxDecoration(
                //               border: Border.all(
                //                   color: AppColors.secondaryText, width: 2)),
                //           // margin: EdgeInsets.all(2.0),
                //           child: Stack(
                //             children: [
                //               Column(
                //                 children: [
                //                   SizedBox(
                //                     height: 126,
                //                     child: ClipRRect(
                //                       borderRadius: const BorderRadius.all(
                //                           Radius.circular(2.0)),
                //                       child: Image.network(e.picture!,
                //                           fit: BoxFit.cover, width: 1000.0),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Positioned(
                //                 bottom: 18,
                //                 // right: MediaQuery.of(context).size.width * .30,
                //                 child: Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 40),
                //                   child: Container(
                //                     // width: 960,
                //                     width:
                //                         MediaQuery.of(context).size.width * .60,
                //                     color: const Color.fromRGBO(
                //                         255, 255, 255, 0.3),
                //                     child: Center(
                //                       child: GText(
                //                         text: e.name!,
                //                         color: Colors.white,
                //                         fontSize: 14,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         );
                //       },
                //     ).toList(),
                //     onPageChanged: (index) {
                //       setState(() {
                //         index;
                //       });
                //     },
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Categories:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: cat.categoryList.value.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = cat.categoryList.value.data[index];
                        return InkWell(
                          onTap: () {
                            print(cat.categoryList.value.data[index].id);
                            // plc.getProductListCategory(
                            //     cat.categoryList.value.data[index].id);
                            plc.getProductList(
                                cat.categoryList.value.data[index].id);
                            globals.category_id = mydata.id;
                            Get.to(() => const ProductListCategory());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Column(
                              children: [
                                GFAvatar(
                                    backgroundImage:
                                        NetworkImage(mydata.image.toString()),
                                    shape: GFAvatarShape.standard),
                                Text(mydata.name.toString()),
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                // recently added products
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text("Top Rated products")),
                      Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primarycolor),
                              ),
                              onPressed: () {
                                // ProductTab
                                Get.to(() => const ProductTab());
                              },
                              child: GText(
                                text: "View all",
                                color: Colors.white,
                              )))
                    ],
                  ),
                ),

                //  pd.getProductDetail(mydata.id!);
                //         Get.to(() => const ProductDetailPage());
                // ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     physics: const BouncingScrollPhysics(),
                //     itemCount: rp.recentProductList.value.data.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       var mydata = rp.recentProductList.value.data[index];
                //       return Stack(
                //         children: [
                //           Card(
                //             color: Colors.grey.shade100,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(10)),
                //           )
                //         ],
                //       );
                //     }),
                // ListView.builder(
                //     itemCount: rp.recentProductList.value.data.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       var mydata = rp.recentProductList.value.data[index];
                //       return Stack(
                //         children: [
                //           Column(
                //             children: [
                //               Card(
                //                 elevation: 3,
                //                 color: Colors.red,
                //                 child: Container(
                //                   decoration: const BoxDecoration(
                //                       borderRadius: BorderRadius.only(
                //                           topLeft: Radius.circular(10),
                //                           topRight: Radius.circular(10))),
                //                   height: 120,
                //                   width: 200,
                //                   child: ClipRRect(
                //                     borderRadius: const BorderRadius.only(
                //                         topLeft: Radius.circular(10),
                //                         topRight: Radius.circular(10)),
                //                     child: Image.network(mydata.picture.toString()),
                //                     // child: FadeInImage(
                //                     //   placeholder: AssetImage('images/image.png'),
                //                     //   image: Image.asset("name"),
                //                     //   fit: BoxFit.cover,
                //                     //   width: 120,
                //                     //   height: 120,
                //                     //   fadeInDuration: Duration(seconds: 1),
                //                     //   fadeOutDuration: Duration(seconds: 1),
                //                     // ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Positioned(child: Text("shsdhj"))
                //         ],
                //       );
                //     })

                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   physics: const BouncingScrollPhysics(),
                //   itemCount: rp.recentProductList.value.data.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     var mydata = rp.recentProductList.value.data[index];
                //     return Stack(
                //       children: [
                //         Column(
                //           children: [
                //             Card(
                //               elevation: .3,
                // color: Colors.grey.shade100,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)),
                // child: Container(
                //   decoration: const BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(10),
                //           topRight: Radius.circular(10))),
                //   height: 120,
                //   width: 200,
                //   child: ClipRRect(
                //     borderRadius: const BorderRadius.only(
                //         topLeft: Radius.circular(10),
                //         topRight: Radius.circular(10)),
                //     child: Image.network(
                //         mydata.picture.toString()),
                //     child: FadeInImage(
                //       placeholder: AssetImage('images/image.png'),
                //       image: Image.asset("name"),
                //       fit: BoxFit.cover,
                //       width: 120,
                //       height: 120,
                //       fadeInDuration: Duration(seconds: 1),
                //       fadeOutDuration: Duration(seconds: 1),
                //     // ),
                //   ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Column(
                //                 crossAxisAlignment:
                //                     CrossAxisAlignment.start,
                //                 children: [
                //                   Container(
                //                     height: 45,
                //                     child: Text(
                //                       mydata.name!,
                //                       style: TextStyle(
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w500,
                //                         color: AppColors.secondaryText,
                //                       ),
                //                       maxLines: 2,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //         Positioned(
                //           child: mydata.discount == null
                //               ? const SizedBox(
                //                   width: 10,
                //                   height: 10,
                //                 )
                //               : Positioned(
                //                   // bottom: 2,

                //                   child: Container(
                //                     // height: 50,
                //                     child: Text(
                //                       '-' +
                //                           mydata.discount.toString() +
                //                           '%',
                //                       style: TextStyle(color: Colors.red),
                //                     ),
                //                   ),
                //                 ),
                //         ),
                //       ],
                //     );
                //   },
                // ),
                // ElevatedButton(onPressed: show, child: const Text('data')),

                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  shrinkWrap: true,
                  itemCount: tp.topRated.value.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mydata = tp.topRated.value.data[index];
                    if ((mydata.discount != null)) {
                      // rewardIcon = const Icon(Icons.check_circle_outline,
                      //     color: Colors.green, size: 24);
                      statusColor = Colors.green;
                      discount = mydata.discount!.toInt().toString();
                    } else if (mydata.discount == null) {
                      // rewardIcon = const Icon(Icons.redeem_rounded,
                      //     color: Colors.red, size: 24);
                      statusColor = Colors.red;
                      discount = 0;
                    }
                    return InkWell(
                      onTap: () {
                        // print("taoppped");

                      pd.getProductDetail(mydata.id!);
                      Get.to(() => const ProductDetailPage());



                      },
                      child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Card(
                            child: Container(
                              height: 250,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                // color: Colors.red,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      child: Image.network(
                                        mydata.image!,
                                        fit: BoxFit.cover,
                                        height: 120,
                                        width: double.infinity,
                                      ),

                                      //     Image(
                                      //   image: NetworkImage(),
                                      //   fit: BoxFit.cover,
                                      // )
                                    ),
                                  ),

                                  // BAPTText(text: mydata.name),
                                  // BAPTText(text: mydata.price.toString()),
                                  SizedBox(
                                    height: 30,
                                    child: ListTile(
                                      title: GText(
                                        text: mydata.product!,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      subtitle: GText(
                                          text:
                                              mydata.price!.toInt().toString()),
                                      trailing: rewardIcon,
                                    ),
                                  )

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
                        ),
                        Positioned(
                          top: 100,
                          left: 140,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: statusColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GText(

                                      // text: mydata.discount!.toInt().toString(),

                                      text: discount.toString() + " %",
                                      color: Colors.white,
                                      fontSize: 12),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ],
            ),
          ),
          // )
        ));
  }
}
