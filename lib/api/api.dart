// import 'dart:convert';
// import 'dart:html';

// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class Api {
//   String baseURL = "";
//   // Get
//   Future getData(String endPoint) async {
//     String url = baseURL + endPoint;
//     var response = await http.get(Uri.parse(url), headers: {
//       'Accept': 'application/json',
//       'Authorization': "Bearer ",
//     });

//     // Get Data Without Token
//     Future getData(String endPoint) async {
//       String url = baseURL + endPoint;
//       var response = await http
//           .get(Uri.parse(url), headers: {'Accept': 'application/json'});
//       return response;
//     }

//     // Get Data With Token
//     Future getDataWithToken(String endPoint) async {
//       String url = baseURL + endPoint;
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       var token = preferences.getString("token");
//       var response = await http.get(Uri.parse(url), headers: {
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token'
//       });
//       return response;
//     }

//     // login and register Method
//     Future loginOrRegister(Map data, String endPoint) async {
//       String url = baseURL + endPoint;
//       var response = await http.post(Uri.parse(url),
//           headers: {
//             'content-Type': 'application/json',
//             'Accept': 'application/json'
//           },
//           body: jsonEncode(data));
//       return response;
//     }
//   }
//   // Post
// }
import 'dart:convert';
import 'package:flutter_fyp/model/cart_model.dart';
import 'package:flutter_fyp/model/user_detail.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  // String baseURL = "http://192.168.43.43:8000/api/";
  String baseURL = "http://192.168.254.190:8000/api/";

  Future getData(String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    print(token);
    var response = await http.get(Uri.parse(url), headers: {
      
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    });
    print(response);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return data;
    } else {
      return null;
    }
  }

  // Delete
  Future delete(String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");

    var response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      return data;
    } else {
      return null;
    }
  }

  Future postData(Map data, String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return data;
    } else {
      return null;
    }
    //  if (response.statusCode == 200) {
    //     var jsonString = response.body;
    //     return cartModelFromJson(jsonString);
    //   } else {
    //     return null;
    //   }
  }

  Future logOut(Map data, String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? token = preferences.getString("token");
    var token = preferences.getString("token");

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    print(response.statusCode);
    return response;
    //  if (response.statusCode == 200) {
    //     var jsonString = response.body;
    //     return cartModelFromJson(jsonString);
    //   } else {
    //     return null;
    //   }
  }
  Future loginAndRegister(Map data, String endPoint) async {
    String url = baseURL + endPoint;
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data));

    return response;
  }
}
