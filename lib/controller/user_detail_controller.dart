import 'package:flutter_fyp/model/contact_model.dart';
import 'package:flutter_fyp/model/user_detail.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class UserDetailController extends GetxController{
  var userDetail = UserDetailModel().obs;
  var loading = true.obs;
  Future getUserDetail() async{
    try{
      loading(true);
      var data = await RemoteService.fetchUserDetail();
      if(data != null){
        // categoryList.value = data;
        userDetail.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);
    }
  }
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getUserDetail();
  // }
}