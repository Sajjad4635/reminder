import 'package:flutter/material.dart';
import 'package:reminder/core/theme/app_color.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextOverflow? textOverflow;
  TextStyle? textStyle;
  final double? fontSize;
  final double? height;
  final Color? color;
  final FontWeight fontWeight;
  final TextDirection textDirection;

  TextWidget.regular(
      {super.key,
      required this.text,
      this.fontSize = 12,
      this.height = 1.5,
      this.textOverflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.w100,
      this.color = AppColor.textColor,
      this.alignment = TextAlign.center,
      this.textDirection = TextDirection.rtl,
      this.textStyle = const TextStyle(fontWeight: FontWeight.normal)});

  TextWidget.medium({
    super.key,
    this.fontSize = 12,
    this.height = 1.5,
    this.textOverflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.w500,
    this.color = AppColor.textColor,
    required this.text,
    this.alignment = TextAlign.center,
    this.textDirection = TextDirection.rtl,
  }) {
    textStyle = TextStyle(
      color: AppColor.mainYellow,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
    );
  }

  TextWidget.bold({
    super.key,
    this.fontSize,
    this.height = 1.5,
    this.textOverflow = TextOverflow.ellipsis,
    this.color = AppColor.textColor,
    required this.text,
    this.alignment,
    this.fontWeight = FontWeight.bold,
    this.textDirection = TextDirection.rtl,
  }) {
    textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      textDirection: textDirection,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Dana',
        height: height,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
