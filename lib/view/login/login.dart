import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fyp/api/api.dart';
import 'package:flutter_fyp/const/accountTextController.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/primaryButton.dart';
import 'package:flutter_fyp/controller/rating_controller.dart';
import 'package:flutter_fyp/view/bottom/bottom.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool flag = true;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var rpd = Get.find<RatingController>();
    // bool flag = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          // key: _key,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("images/logo.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.50,
                    color: AppColors.whitecolor,
                  )
                ],
              ),
              Positioned(
                top: 360,
                left: MediaQuery.of(context).size.width * .02,
                right: MediaQuery.of(context).size.width * .02,
                child: Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: 290,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ]),
                  child: Column(
                    children: [
                      // SizedBox(
                      //     height: 5,
                      //     child: ElevatedButton(
                      //         onPressed: () {
                      //           Navigator.pushNamed(context, 'register');
                      //         },
                      //         child: Text("register"))),
                      const Text(
                        "LogIn",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              value!.isEmpty ? 'Empty field found' : null,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                flag = !flag;
                                setState(() {});
                              },
                              icon: flag == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility_outlined),
                              color: Colors.black,
                            ),
                            hintText: "Password",
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Empty field found' : null,
                          obscureText: flag,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          splashColor: AppColors.primarycolor,
                          onTap: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Are you a new user?',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                TextSpan(
                                  text: 'Register here',
                                  style: TextStyle(
                                      color: AppColors.primarycolor,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .46 + 240,
                left: MediaQuery.of(context).size.width * .20,
                right: MediaQuery.of(context).size.width * .20,
                child: SizedBox(
                  height: 40,
                  child: 
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primarycolor),
                    ),
                    onPressed: () async {
                      Map data = {
                        "email": email.text,
                        "password": password.text
                      };

                      var response =
                          await Api().loginAndRegister(data, 'logIn');
                      var result = json.decode(response.body);
                      print(result);
                      print(response.statusCode);

                      if (response.statusCode == 200) {
                        // Save Token in Local storage
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString('token', result['token']);
                        // Navigator.popAndPushNamed(context, 'mainScreen');
                        rpd.getRatedProduct();
                        Get.off(() => const BottomNav());
                      } else {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return AlertDialog(
                                title: Text("Error"),
                                content:
                                    const Text("Invalid email or password"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // Get.snackbar('Message', 'Welcome to ghardhailo', snackPosition:SnackPosition.BOTTOM );
                                      },
                                      child: Text("OK"))
                                ],
                              );
                            });
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 24, fontFamily: "Roboto"),
                    ),
                  ),
                
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
