import 'package:flutter_fyp/model/order_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';
 
class OrderController extends GetxController{
  var orders = OrderModel(data: []).obs;
  Future getOrders() async{
    try{
      var data = await RemoteService.fetchOrders();
      if(data != null){
        // categoryList.value = data;
        orders.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
 
}
