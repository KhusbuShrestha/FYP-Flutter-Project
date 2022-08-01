import 'package:flutter/material.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/controller/wishlist_controller.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/category/category.dart';
import 'package:flutter_fyp/view/mainScreen/dashboard.dart';
import 'package:flutter_fyp/view/product.dart/product.dart';
import 'package:flutter_fyp/view/product_profile/product_profile.dart';
import 'package:flutter_fyp/view/producttab/productpage.dart';
import 'package:flutter_fyp/view/search/search_page.dart';
import 'package:flutter_fyp/view/wish_list/wish_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int barIndex = 0;
  @override
  Widget build(BuildContext context) {
    var wc = Get.find<WishlistController>();
    wc.getWishlistItems();
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        // type: BottomNavigationBarType.fixed,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        snakeViewColor: AppColors.whitecolor,

        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        // padding: EdgeInsets.all(10),
        backgroundColor: AppColors.primarycolor,
        selectedItemColor: AppColors.whitecolor,
        // selectedFontSize: 14.0,
        selectedLabelStyle: TextStyle(),
        unselectedItemColor: Colors.white,

        // unselectedFontSize: 4.0,
        unselectedLabelStyle: TextStyle(fontFamily: "monospace"),
        onTap: (int value) {
          // donkey = value;
          setState(() {
            barIndex = value;
          });
        },
        currentIndex: barIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: "Search",
            activeIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              FontAwesomeIcons.heart,
              color: Colors.black,
            ),
            icon: Icon(FontAwesomeIcons.heart),
            // icon: IconButton(onPressed: (){

            //   wc.getWishlistItems();
            // }, icon: Icon(FontAwesomeIcons.heart),),
            label: "Trans.",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              FontAwesomeIcons.productHunt,
              color: Colors.black,
            ),
            icon: Icon(FontAwesomeIcons.productHunt),
            // label: "Pdf",
          ),
        ],
      ),
      body: barIndex == 0
          ? MainScreen()
          : barIndex == 1
              ? SearchPage()
              : barIndex == 2
                  ? WishlistPage()
                  : ProductTab(),
    );
  }
}
