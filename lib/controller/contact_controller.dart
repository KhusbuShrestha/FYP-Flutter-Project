import 'package:flutter_fyp/model/contact_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{
  var contactList = <ContactModel> [].obs;
  Future getContactList() async{
    try{
      var data = await RemoteService.fetchContact();
      if(data != null){
        // categoryList.value = data;
        contactList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getContactList();
  }
}