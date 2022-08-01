import 'package:flutter_fyp/model/order_desc_model.dart';
import 'package:flutter_fyp/model/product_list.dart';
import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';
 
class OrderDescController extends GetxController{
  var orderDesc = OrderDescModel(data: []).obs;
  var loading = true.obs;
  Future getOrderDesc(int id) async{
    try{
      loading(true);
      var data = await RemoteService.fetchOrderDesc(id);
      if(data != null){
        orderDesc.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);

    }
  }
 
}
