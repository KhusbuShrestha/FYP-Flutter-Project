import 'package:flutter_fyp/model/contact_model.dart';
import 'package:flutter_fyp/model/descending_model.dart';
import 'package:flutter_fyp/model/increasing_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class DecreaseController extends GetxController{
  var descProducts = DecreaseModel(data: []).obs;
  var loading = true.obs;
  Future getDecreaseProductList(int id) async{
    try{
      loading(true);
      var data = await RemoteService.fetchDecreaseProduct(id);
      if(data != null){
        // categoryList.value = data;
        descProducts.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally{
      loading(false);

    }
  }
 
}