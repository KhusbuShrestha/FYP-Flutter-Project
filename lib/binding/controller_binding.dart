import 'package:flutter_fyp/controller/about_controller.dart';
import 'package:flutter_fyp/controller/average_rating_controller.dart';
import 'package:flutter_fyp/controller/cart_controller.dart';
import 'package:flutter_fyp/controller/cart_total.dart';
import 'package:flutter_fyp/controller/category_controller.dart';
import 'package:flutter_fyp/controller/contact_controller.dart';
import 'package:flutter_fyp/controller/delivery_address_controller.dart';
import 'package:flutter_fyp/controller/descending_controller.dart';
import 'package:flutter_fyp/controller/increasing_controller.dart';
import 'package:flutter_fyp/controller/order_controller.dart';
import 'package:flutter_fyp/controller/order_desc_controller.dart';
import 'package:flutter_fyp/controller/product_controller.dart';
import 'package:flutter_fyp/controller/product_detail_controller.dart';
import 'package:flutter_fyp/controller/product_list_category_Controller.dart';
import 'package:flutter_fyp/controller/product_list_controller.dart';
import 'package:flutter_fyp/controller/rating_controller.dart';
import 'package:flutter_fyp/controller/recetly_products.dart';
import 'package:flutter_fyp/controller/search_controller.dart';
import 'package:flutter_fyp/controller/shipping_controller.dart';
import 'package:flutter_fyp/controller/team_controller.dart';
import 'package:flutter_fyp/controller/top_products.dart';
import 'package:flutter_fyp/controller/user_detail_controller.dart';
import 'package:flutter_fyp/controller/wishlist_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CategoryController());
    Get.put(ContactController());
    Get.put(TeamController());
    Get.put(ShippingController());
    Get.put(AboutController());
    Get.put(ProductController());
    Get.put(ProductListCategoryController());
    Get.put(ProductListController());
    Get.put(ProductDetailController());
    Get.put(UserDetailController());
    Get.put(CartController());
    Get.put(CartTotalController());
    Get.put(WishlistController());
    Get.put(OrderController());
    Get.put(OrderDescController());
    Get.put(AverageRatingController());
    Get.put(SearchController());
    Get.put(RecentlyProductsController());
    Get.put(RatingController());
    Get.put(IncreaseController());
    Get.put(DeliveryAddressController());
    Get.put(TopProductsController());
    Get.put(DecreaseController());
    
  }
 
}