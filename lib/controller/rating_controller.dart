import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/model/rating_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RatingController extends GetxController{
  var ratedProduct = RatingModel(data: []).obs;
  var loading = true.obs;
  Future getRatedProduct() async{
    try{
      loading(true);
      var data = await RemoteService.fetchRatedProduct();
      if(data != null){
        ratedProduct.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);

    }
  }
  // @override
  // void onInit() {
  //   super.onInit();
  //   getProductList();
  // }
}