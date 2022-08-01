// ignore_for_file: file_names
 
import 'package:flutter_fyp/model/average_rating.dart';
import 'package:flutter_fyp/service/remote_service.dart';
import 'package:get/get.dart';
 
class AverageRatingController extends GetxController{
  static var totalUsers;

  static var averageRating;
//  var productRating = AverageRatingModel(averageRating: averageRating, totalUsers: totalUsers, reviews: []).obs;


// var productRating = AverageRatingModel(reviews: []).obs;
var productRating = AverageRatingModel(reviews: []).obs;
// var productRating = AverageRatingModel(averageRating: averageRating).obs;
  
  // static var averageRating;



   Future getAverageRating(int id) async{
    try{
      var data = await RemoteService.fetchAverageRating(id);
      if(data != null){
        productRating.value = data;
// productRating.averageRating = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
 
 
}
