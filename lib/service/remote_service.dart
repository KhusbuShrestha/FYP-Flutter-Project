import 'dart:convert';

import 'package:flutter_fyp/const/error_message.dart';
import 'package:flutter_fyp/const/success_message.dart';
import 'package:flutter_fyp/model/about_model.dart';
import 'package:flutter_fyp/model/average_rating.dart';
import 'package:flutter_fyp/model/cart_model.dart';
import 'package:flutter_fyp/model/cart_total.dart';
import 'package:flutter_fyp/model/category_model.dart';
import 'package:flutter_fyp/model/contact_model.dart';
import 'package:flutter_fyp/model/delivery_address.dart';
import 'package:flutter_fyp/model/descending_model.dart';
import 'package:flutter_fyp/model/increasing_model.dart';
import 'package:flutter_fyp/model/order_desc_model.dart';
import 'package:flutter_fyp/model/order_model.dart';
import 'package:flutter_fyp/model/product_detail_model.dart';
import 'package:flutter_fyp/model/product_list.dart';
import 'package:flutter_fyp/model/product_list_category_model.dart';
import 'package:flutter_fyp/model/product_model.dart';
import 'package:flutter_fyp/model/rating_model.dart';
import 'package:flutter_fyp/model/recently_products.dart';
import 'package:flutter_fyp/model/shipping_model.dart';
import 'package:flutter_fyp/model/team_model.dart';
import 'package:flutter_fyp/model/top_products.dart';
import 'package:flutter_fyp/model/top_rated.dart';
import 'package:flutter_fyp/model/user_detail.dart';
import 'package:flutter_fyp/model/wishlist_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteService {
  static var client = http.Client();
  // static var baseURL = "http://192.168.43.43:8000/api/";
  static var baseURL = "http://192.168.254.190:8000/api/";

  static Future<CategoryModel?> fetchCategory() async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "categories"), headers: {
        'Accept': 'application/json',
      });
      print(response.statusCode);
      
      
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return categoryModelFromJson(jsonString);
        
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // CONTACT REMOTE
  static Future<List<ContactModel>?> fetchContact() async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "contacts"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return contactModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // OUR TEAM REMOTE
  static Future<List<TeamModel>?> fetchTeam() async {
    try {
      var response = await client.get(Uri.parse(baseURL + "teams"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return teamModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // SHIPPING REMOTE
  static Future<List<ShippingModel>?> fetchShipping() async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "shippings"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return shippingModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // ABOUT REMOTE
  static Future<List<AboutModel>?> fetchAbout() async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "about_us"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return aboutModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  // PRODUCT REMOTE

  static Future<ProductModel?> fetchProduct() async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "products"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<RecentlyProductsModel?> fetchRecentProduct() async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "recentlyProducts"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return recentlyProductsModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<TopRatedModel?> fetchTopProduct() async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "topRated"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return topRatedModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // product accoridng to the category
  static Future<ProductListCategoryModel?> fetchProductListCategories(
      int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL + "categories/$id"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productListCategoryModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // product list
  static Future<ProductListModel?> fetchProductList(int id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in product list");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "categories/$id"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productListModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // each product detail
  static Future<ProductDetailModel?> fetchProductDetail(int id) async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "products/$id"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productDetailModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // cart items
  static Future<CartModel?> fetchCartItems() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in product list");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "cart"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      // var response =
      //     await client.get(Uri.parse(baseURL + "cart/$id"), headers: {
      //   'Accept': 'application/json',
      // },
      // );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return cartModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // cart total
  static Future<CartTotalModel?> fetchCartTotal() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in cart total");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "cartTotal"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return cartTotalModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // user detail
  static Future<UserDetailModel?> fetchUserDetail() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "user"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });

      print("my code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        print("going");
        var jsonString = response.body;
        return userDetailModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // cart items
  static Future<OrderModel?> fetchOrders() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in product list");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "orders"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      // var response =
      //     await client.get(Uri.parse(baseURL + "cart/$id"), headers: {
      //   'Accept': 'application/json',
      // },
      // );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return orderModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // cart items
  static Future<OrderDescModel?> fetchOrderDesc(int id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in order desc list");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "userOd/$id"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      // var response =
      //     await client.get(Uri.parse(baseURL + "cart/$id"), headers: {
      //   'Accept': 'application/json',
      // },
      // );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return orderDescModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // cart total
  static Future<AverageRatingModel?> fetchAverageRating(int id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in average rating total");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "averageRating/$id"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return averageRatingModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //  for post of all
  static Future postData(String endPoint, Map data) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");
      // "$baseURL"
      var response = await client.post(Uri.parse(baseURL + endPoint),
          headers: {
            'Content-type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(data));
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body);
        // Get.snackbar("Message", result['message']);
        successMessage(result['message']);
      } else {
        // Get.snackbar("Message", "error");
        errorMessage('Append Process Failed');
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }

  //  for delete of all
  static Future deleteData(String endPoint) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");
      // "$baseURL"
      var response =
          await client.delete(Uri.parse(baseURL + endPoint), headers: {
        'Content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body);
        // Get.snackbar("Message", result['message']);
        successMessage(result['message']);
      } else {
        errorMessage("Error! Item not deleted");
        Get.snackbar("Message", "error");
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }

  // WISH LIST
  static Future<WishlistModel?> fetchWishlistItems() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in wish list");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "wishlist"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      // var response =
      //     await client.get(Uri.parse(baseURL + "cart/$id"), headers: {
      //   'Accept': 'application/json',
      // },
      // );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return wishlistModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // delivery addess
  static Future<DeliveryAddressModel?> fetchDelAddress() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in del ads list");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "delAddress"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return deliveryAddressModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // product list
  static Future<ProductModel?> fetchSearchList(String searchWord) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in product list");
      print(token);
      var response = await client
          .get(Uri.parse(baseURL + "productSearch/$searchWord"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<RatingModel?> fetchRatedProduct() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in cart total");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "ratings"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return ratingModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // // Increase Product
  // static Future<IncreaseModel?> fetchIncreaseProduct(int id) async {
  //   try {
  //     var response =
  //         await client.get(Uri.parse(baseURL + "/increaseOrder/$id"), headers: {
  //       'Accept': 'application/json',
  //     });
  //     if (response.statusCode == 200) {
  //       var jsonString = response.body;
  //       return increaseModelFromJson(jsonString);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

// // Decrease Product
//   static Future<DecreaseModel?> fetchDecreaseProduct(int id) async {
//     try {
//       print("gone");
//       var response =
//           await client.get(Uri.parse(baseURL + "/decreaseOrder/$id"), headers: {
//         'Accept': 'application/json',
//       });
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         return decreaseModelFromJson(jsonString);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }

  // each product detail
  static Future<DecreaseModel?> fetchDecreaseProduct(int id) async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "decreaseOrder/$id"), headers: {
        'Accept': 'application/json',
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return decreaseModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

    // each product detail
  static Future<IncreaseModel?> fetchIncreaseProduct(int id) async {
    try {
      var response =
          await client.get(Uri.parse(baseURL + "increaseOrder/$id"), headers: {
        'Accept': 'application/json',
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return increaseModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}
