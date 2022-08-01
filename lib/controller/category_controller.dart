import 'package:flutter_fyp/model/category_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  var categoryList = CategoryModel(data: []).obs;

// List<List<CategoryModel>>
  Future getCategoryList() async{
    try{
      var data = await RemoteService.fetchCategory();
      if(data != null){
        categoryList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryList();
  }
}