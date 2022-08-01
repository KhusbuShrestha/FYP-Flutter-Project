import 'package:flutter/material.dart';
import 'package:flutter_fyp/components/cross.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/rating_controller.dart';
import 'package:flutter_fyp/view/product.dart/product.dart';
import 'package:flutter_fyp/view/product.dart/rated_product.dart';
import 'package:flutter_fyp/view/search/search_page.dart';
import 'package:get/get.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rate
     = Get.find<RatingController>();
    return DefaultTabController(
      
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: crossButton(context),
          backgroundColor: AppColors.primarycolor,
          bottom: TabBar(
              isScrollable: false,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  child: Container(child: Text("Product")),
                ),
                Tab(
                  child: InkWell(
                    onTap: (){
                      rate.getRatedProduct();
                      
                    },
                    child: Container(child: Text("Rated Product"))),
                ),
              ]),
        ),
        body: TabBarView(children: [
          ProductPage(),
          RatedProductPage(),
        ]),
      ),
    );
  }
}