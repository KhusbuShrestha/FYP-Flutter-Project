import 'package:flutter_fyp/model/delivery_address.dart';
import 'package:flutter_fyp/model/wishlist_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class DeliveryAddressController extends GetxController{
    var delAddress = DeliveryAddressModel(data: []).obs;
    var loading = true.obs;
  Future getDeliveryAddress() async{
    try{
      loading(true);
      var data = await RemoteService.fetchDelAddress();
      if(data != null){
        delAddress.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);
    }
  }

}