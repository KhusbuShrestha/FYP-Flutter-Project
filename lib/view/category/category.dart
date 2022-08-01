
import 'package:flutter/material.dart';
import 'package:flutter_fyp/controller/category_controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/view/product_list_category/product_list_category.dart';
import 'package:get/get.dart';

class CatgeoryPage extends StatefulWidget {
  const CatgeoryPage({Key? key}) : super(key: key);

  @override
  State<CatgeoryPage> createState() => _CatgeoryPageState();
}

class _CatgeoryPageState extends State<CatgeoryPage> {
  @override
  Widget build(BuildContext context) {
    var cpage = Get.find<CategoryController>();
    var page = Get.find<ProductListController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: cpage.categoryList.value.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      print(cpage.categoryList.value.data[index].id);
                      page.getProductList(
                          cpage.categoryList.value.data[index].id);
                      Get.to(() => const ProductListCategory());
                    },
                    child: ListTile(
                      title: Text(cpage.categoryList.value.data[index].name),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
