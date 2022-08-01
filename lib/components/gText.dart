import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fyp/const/color.dart';

class GText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;

  GText(
      {Key? key,
      required this.text,
      this.color = AppColors.primarycolor,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.visible,
      this.maxLines = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
