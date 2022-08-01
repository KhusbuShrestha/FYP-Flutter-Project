import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fyp/api/api.dart';
import 'package:flutter_fyp/const/accountTextController.dart';
import 'package:flutter_fyp/const/color.dart';
import 'package:flutter_fyp/const/error_message.dart';
import 'package:flutter_fyp/const/info_message.dart';
import 'package:flutter_fyp/const/primaryButton.dart';
import 'package:flutter_fyp/view/drawer/drawer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool flag = true;
  
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
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
                top: 320,
                left: MediaQuery.of(context).size.width * .02,
                right: MediaQuery.of(context).size.width * .02,
                child: Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: 370,
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
                      const SizedBox(
                        height: 5,
                      ),
                      // myPlainTextFormField("text1", email, Icons.email),
                      const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          // maxLength: 10,
                          controller: name,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            hintText: "Name",
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
                          controller: email,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            hintText: "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          // validator:  (value) =>
                          //     value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ? 'Empty field found' : null,  
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 10,
                          controller: phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            hintText: "Number",
                          ),
                          keyboardType: TextInputType.number,
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
                          obscureText: flag,
                          validator: (value) =>
                              value!.isEmpty ? 'Empty field found' : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .50 + 246,
                left: MediaQuery.of(context).size.width * .20,
                right: MediaQuery.of(context).size.width * .20,
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primarycolor),
                    ),
                    // onPressed:() {
                    //   print("register presed");
                    // },

                    onPressed: () async {
                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      String passv = r'(^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$)';
                      RegExp regExp = new RegExp(patttern);
                      RegExp regPass = new RegExp(passv);
                      if (name.text.isEmpty ||
                          email.text.isEmpty ||
                          phone.text.isEmpty ||
                          password.text.isEmpty) {
                        errorMessage("Please fill all the fields");
                      }
                      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text)){
                         errorMessage("Email format incorrect");
                      }
                      else if (!regExp.hasMatch(phone.text)

                      ){
                        errorMessage("Please Enter Valid Phone Number");

                      }
                      else if(!regPass.hasMatch(password.text)){
                        errorMessage("Your password must have a minimum strength of strong");
                      }
                      
                      else {
                        Map data = {
                          "name": name.text,
                          "email": email.text,
                          "phone_number": phone.text,
                          "password": password.text
                        };
                        // print('this is sata');
                        print(data);

                        var response =
                            await Api().loginAndRegister(data, 'register');
                        var result = json.decode(response.body);
                        print(response.statusCode);
                        if (response.statusCode == 201) {
                          // CoolAlert.show(context: context, type: CoolAlertType.success );
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.BOTTOMSLIDE,
                              title: 'SUCCESS',
                              desc: 'Account Created Successfully',
                              buttonsTextStyle:
                                  const TextStyle(color: Colors.black),
                              btnOkOnPress: () {
                                // Get.snackbar('Message', 'Welcom to ghardhailo', snackPosition:SnackPosition.BOTTOM );
                                Navigator.pushNamed(context, 'logIn');
                              }).show();
                        } else {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.TOPSLIDE,
                              title: 'ERROR',
                              desc: "Somethig went wrong",
                              btnOkOnPress: () {
                                Navigator.popAndPushNamed(context, 'register');
                              }).show();
                        }
                      }
                    },
                    child: Text(
                      "REGISTER",
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
