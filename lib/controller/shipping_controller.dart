import 'package:flutter_fyp/model/category_model.dart';
import 'package:flutter_fyp/model/shipping_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController{
  var shippingList = <ShippingModel> [].obs;
// List<List<CategoryModel>>
  Future getShippingList() async{
    try{
      var data = await RemoteService.fetchShipping();
      if(data != null){
        shippingList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getShippingList();
  }
}