import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color? textcolor;
  final Color? buttoncolor;
  final double? minWidth;
  final double? height;
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.textcolor,
    this.buttoncolor,
    this.minWidth,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      clipBehavior: Clip.antiAlias,
      height: height ?? 60,
      minWidth: minWidth ?? Get.width * 0.7,
      color: buttoncolor ?? AppColors.lightColor,
      onPressed: onPressed,
      child: Text(title,
          style: TextStyle(
              letterSpacing: 0.5,
              fontFamily: AppFontStyle.fontStyle,
              color: textcolor ?? AppColors.customappColorstow,
              fontSize: 17,
              fontWeight: FontWeight.bold)),
    ));
  }
}
