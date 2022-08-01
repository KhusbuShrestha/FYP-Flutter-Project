import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController errorMessage(String message) {
  return Get.snackbar(" Error",
  message,
      // borderWidth: 3,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      // borderColor: Colors.red[900],
      backgroundColor: Color.fromRGBO(255, 255, 255, .6),
      icon: Icon(
        Icons.info,
        color: Colors.red[900],
        size: 40,
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      barBlur: 10);
}