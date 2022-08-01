import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/model/recently_products.dart';
import 'package:flutter_fyp/model/top_products.dart';
import 'package:flutter_fyp/model/top_rated.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class TopProductsController extends GetxController{
  var topRated = TopRatedModel(data: []).obs;
  Future getTopRated() async{
    try{
      var data = await RemoteService.fetchTopProduct();
      if(data != null){
        topRated.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    super.onInit();
    getTopRated();
  }
}