import 'package:flutter_fyp/model/cart_model.dart';
import 'package:flutter_fyp/model/cart_total.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class CartTotalController extends GetxController{
    var cartTotal = CartTotalModel(total: total).obs;

  static var total;
  Future getCartTotal() async{
    try{
      var data = await RemoteService.fetchCartTotal();
      if(data != null){
        cartTotal.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}