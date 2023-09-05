import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
  final TextAlign? textAlign;
  final String title;
  final double? fontSize;
  const CustomTextStyle(
      {Key? key, required this.title, this.fontSize, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      maxLines: 2,
      title,
      style: TextStyle(
          letterSpacing: 0.0,
          fontFamily: AppFontStyle.fontStyle,
          fontSize: fontSize,
          color: AppColors.customappColors,
          fontWeight: FontWeight.bold),
    );
  }
}
