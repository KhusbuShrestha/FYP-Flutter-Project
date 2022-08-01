import 'package:flutter_fyp/model/product_detail_model.dart';
import 'package:flutter_fyp/model/product_list.dart';
import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController{
  var productDetail = ProductDetailModel(data: []).obs;
  var loading = true.obs;
  Future getProductDetail(int id) async{
    try{
      loading(true);
      var data = await RemoteService.fetchProductDetail(id);
      if(data != null){
        productDetail.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);
    }
  }
 
}