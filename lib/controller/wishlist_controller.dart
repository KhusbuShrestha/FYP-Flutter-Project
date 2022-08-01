import 'package:flutter_fyp/model/wishlist_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController{
    var wishlistItems = WishlistModel(data: []).obs;
  Future getWishlistItems() async{
    try{
      var data = await RemoteService.fetchWishlistItems();
      if(data != null){
        wishlistItems.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}