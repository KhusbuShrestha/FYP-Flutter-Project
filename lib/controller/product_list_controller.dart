import 'package:flutter_fyp/model/product_list.dart';
import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  var productList = ProductListModel(data: []).obs;
  var loading = true.obs;
  Future getProductList(int id) async {
    try {
      loading(true);
      var data = await RemoteService.fetchProductList(id);
      if (data != null) {
        productList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading(false);
    }
  }
}
