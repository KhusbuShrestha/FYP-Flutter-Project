import 'package:flutter_fyp/model/contact_model.dart';
import 'package:flutter_fyp/model/increasing_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class IncreaseController extends GetxController{
  var increaseProductList = IncreaseModel(data: []).obs;
  var loading = true.obs;

  Future getIncreaseProductList(int id) async{
    try{
      loading(true);
      var data = await RemoteService.fetchIncreaseProduct(id);
      if(data != null){
        // categoryList.value = data;
        increaseProductList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);

    }
  }
 
}