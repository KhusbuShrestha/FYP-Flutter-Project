import 'package:flutter_fyp/model/about_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class AboutController extends GetxController{
  var aboutList = <AboutModel> [].obs;
  Future getAboutList() async{
    try{
      var data = await RemoteService.fetchAbout();
      if(data != null){
        aboutList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAboutList();
  }
}