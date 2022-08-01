import 'package:flutter_fyp/model/product_list.dart';
import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  var search = ProductModel(data: []).obs;
  Future getSearchList(String searchWord) async{
    try{
      var data = await RemoteService.fetchSearchList(searchWord);
      if(data != null){
        search.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
 
}