import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';

class CustomTextCuption extends StatelessWidget {
  final String title;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final String? fontFamily;
  const CustomTextCuption(
      {Key? key,
      required this.title,
      this.fontSize,
      this.textAlign,
      this.color,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: fontFamily ?? AppFontStyle.fontStyle,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: color ?? AppColors.darkColor,
          ),
        ));
  }
}
