import 'package:flutter/material.dart';
import 'package:flutter_fyp/const/color.dart';

Widget primaryButton(BuildContext context, String text, String route) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.primarycolor),
    ),
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child: Text(text),
  );
}
