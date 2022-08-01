import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController infoMessage(String message) {
  return Get.snackbar("Info",
  message,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Color.fromRGBO(255, 255, 255, .6),
      icon: Icon(
        Icons.info,
        color: Colors.blue[700],
        size: 40,
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      barBlur: 10);
}