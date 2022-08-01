// ignore_for_file: file_names

// import 'package:flutter_fyp/model/product_list_category_model.dart';
// import 'package:flutter_fyp/service/remote_service.dart';
// import 'package:get/get.dart';

// class ProductListCategoryController extends GetxController{
//  var productListCategory = ProductListCategoryModel(data: []).obs;
//    Future getProductListCategories(int id) async{
//     try{
//       var data = await RemoteService.fetchProductListCategories(id);
//       if(data != null){
//         productListCategory.value = data;
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }

// }

import 'package:flutter_fyp/model/product_list_category_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class ProductListCategoryController extends GetxController {
  var productListCategory = ProductListCategoryModel(data: []).obs;
  Future getProductListCategory(int id) async {
    try {
      var data = await RemoteService.fetchProductListCategories(id);
      if (data != null) {
        productListCategory.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
