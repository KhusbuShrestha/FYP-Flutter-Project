

import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/components/gText.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/controller/user_detail_controller.dart';
import 'package:flutter_fyp/controller/wishlist_controller.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:flutter_fyp/view/product_detail.dart/product_detail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ud = Get.find<UserDetailController>();
    var wc = Get.find<WishlistController>();
    var newplc = Get.find<ProductListController>();
    var pd = Get.find<ProductDetailController>();
    print('wc');
    print(wc);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          title: const Text("Wishlist"),
          centerTitle: true,
          leading: crossButton(context),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: wc.wishlistItems.value.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          var mydata = wc.wishlistItems.value.data[index];
                          return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () {
                                  // fcfl.getFoodCategoryFoodList(mydata.id);
                                  // Get.to("page")

                                  print('object');
                                  // Get.to(() => const ProductProfile());
                                  // pd.getProductDetail(data.id);
                                  pd.getProductDetail(mydata.product!);
                                  Get.to(() => const ProductDetailPage());
                                },
                                child:
                                    // Card(
                                    //   borderOnForeground: true,
                                    //   color: Colors.grey[200],
                                    //   child: ListTile(
                                    //     title: Text(mydata.name),
                                    //   ),
                                    // ),
                                    Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.elliptical(10, 20),
                                        ),
                                        // border: Border.all(
                                        //     color: AppColors.secondaryText)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ListTile(
                                          leading: GFAvatar(
                                              backgroundImage: NetworkImage(
                                                  mydata.picture.toString()),
                                              shape: GFAvatarShape.standard),
                                          // leading: Image.network(mydata.picture!),

                                          title: GText(
                                            text: mydata.name!.toUpperCase(),
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                          subtitle: GText(
                                            text: mydata.sp!.toString(),
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                          

                                          // subtitle: mydata.,
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
                                          trailing: IconButton(
                                              onPressed: () async {
                                                await RemoteService.deleteData(
                                                    'wishlist/' +
                                                        mydata.id.toString());
                                                // Get.off(() => const CartPage());
                                                wc.getWishlistItems();
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.solidTrashAlt,
                                                color: Colors.black,
                                              )),
                                        ),
                                      )),
                                ),
                              ));
                        }),

                  ),
                ],
              ),
            )),
      ),
    );
  }
}
