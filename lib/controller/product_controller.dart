import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var productList = ProductModel(data: []).obs;
  var loading = true.obs;
  Future getProductList() async{
    try{
      loading(true);
      var data = await RemoteService.fetchProduct();
      if(data != null){
        productList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);
    }
  }
  @override
  void onInit() {
    super.onInit();
    getProductList();
  }
}