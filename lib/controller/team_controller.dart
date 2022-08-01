import 'package:flutter_fyp/model/team_model.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';

class TeamController extends GetxController{
  var teamList = <TeamModel> [].obs;

  Future getTeamList() async{
    try{
      var data = await RemoteService.fetchTeam();
      if(data != null){
        teamList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTeamList();
  }
}