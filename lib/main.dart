import 'package:flutter/material.dart';
import 'package:flutter_fyp/binding/controller_binding.dart';
import 'package:flutter_fyp/view/bottom/bottom.dart';
import 'package:flutter_fyp/view/cart/cart.dart';
import 'package:flutter_fyp/view/category/category.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:flutter_fyp/view/login/login.dart';
import 'package:flutter_fyp/view/mainScreen/dashboard.dart';
import 'package:flutter_fyp/view/others/about_us.dart';
import 'package:flutter_fyp/view/others/contact_us.dart';
import 'package:flutter_fyp/view/others/our_team.dart';
import 'package:flutter_fyp/view/others/shipping.dart';
import 'package:flutter_fyp/view/product.dart/product.dart';
import 'package:flutter_fyp/view/profile/profile.dart';
import 'package:flutter_fyp/view/purchaseList/purchase_list.dart';
import 'package:flutter_fyp/view/register/register.dart';
import 'package:flutter_fyp/view/skip/skip.dart';
import 'package:flutter_fyp/view/splash/splash.dart';
import 'package:flutter_fyp/view/wish_list/wish_list.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      // home: const Splash(),
      initialBinding: ControllerBinding(),
      defaultTransition: Transition.fadeIn,
      transitionDuration:const Duration(seconds: 1),
      routes: {
        "/": (context) => const  Splash(),
        "skip": (context) => const SkipScreen(),
        "logIn": (context) => const LogInPage(),
        "register": (context) => const RegisterPage(),
        "mainScreen": (context) => const BottomNav(),
        "cart": (context) => const CartPage(),
        "drawer": (context) => const MyDrawer(),
        // "categoryPage": (context) => const CategoryPage(),
        "aboutUs": (context) => const AboutUsPage(),
        "ourTeam": (context) => const OurTeamPage(),
        "contactUs": (context) => const ContactUSPage(),
        "profile": (context) => const ProfilePage(),
        "purchaseList": (context) => const PurchaseListPage(),
        // "wishlist": (context) => const WishListPage(),
        "product": (context) => const ProductPage(),
        "shippingPolicy": (context) => const ShippingPage(),
      },
    );
  }
}
