import 'package:flutter/material.dart';
import 'package:flutter_fyp/view/bottom/bottom.dart';
import 'package:flutter_fyp/view/login/login.dart';
import 'package:flutter_fyp/view/mainScreen/dashboard.dart';
import 'package:flutter_fyp/view/skip/skip.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  
  // void checkAuth(){
  //   Future.delayed(const Duration(seconds: 3),(){
  //     Get.off(() => const LogInPage());
  //   });
  //    @override
  //   void initState() {
  //     super.initState();
  //     checkAuth();
      
  //   }

  // }
  Future checkAuth() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    var token = preferences.getString("token");
    // preferences.remove("token");
    print(token);
    if (token != null){
      Future.delayed(Duration(seconds: 1),(){
        // Navigator.popAndPushNamed(context, 'home');
        Get.off(()=> const BottomNav());
      });
    }else{
      Future.delayed(Duration(seconds: 1),(){
        // Navigator.popAndPushNamed(context, 'skip');
        Get.off(()=>SkipScreen());
      });
    }
    // Future.delayed(const Duration(seconds: 3),(){

    //   Get.off(() => const SkipScreen());
    // });

    // Future.delayed(Duration(seconds: 1),(){
    //   Navigator.popAndPushNamed(context, 'login');
    // });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
           child: Container(
            
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage("images/splash.png"),
                  ),
            ),
          ),
      ),
    );
  }
}
