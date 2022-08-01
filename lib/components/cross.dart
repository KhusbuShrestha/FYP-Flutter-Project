
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget crossButton(BuildContext context) {
  return IconButton(onPressed: (){
    // Navigator.pop(context);
    Navigator.pushNamed(context, 'mainScreen');
    // Get.off(page)
  }, icon:Icon(Icons.close),);
}
