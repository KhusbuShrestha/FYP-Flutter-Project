import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/model/recently_products.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RecentlyProductsController extends GetxController{
  var recentProductList = RecentlyProductsModel(data: []).obs;
  Future getRecentProductList() async{
    try{
      var data = await RemoteService.fetchRecentProduct();
      if(data != null){
        recentProductList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    super.onInit();
    getRecentProductList();
  }
}