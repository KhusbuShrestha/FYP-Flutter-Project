import 'package:flutter_fyp/model/cart_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = CartModel(data: []).obs;
 var loading = true.obs;
  Future getCartItems() async {
    try {
      loading(true); 
      var data = await RemoteService.fetchCartItems();
      if (data != null) {
        cartItems.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);

    }
  }
}
