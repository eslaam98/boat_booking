import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonTow extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double? height;
  final double? minWidth;
  final double? borderRadius;
  final Color? sideColor;
  final Color? color;

  const CustomButtonTow({
    Key? key,
    required this.title,
    required this.onPressed,
    this.height,
    this.minWidth,
    this.sideColor,
    this.borderRadius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: sideColor ?? const Color(0xFFfbfbfb),
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 50.0)),
      clipBehavior: Clip.antiAlias,
      color: color,
      height: height ?? 60,
      minWidth: minWidth ?? Get.width * 0.7,
      onPressed: onPressed,
      child: Text(title,
          style: TextStyle(
              letterSpacing: 0.5,
              fontFamily: AppFontStyle.fontStyle,
              color: sideColor ?? AppColors.greyColor,
              fontSize: 17,
              fontWeight: FontWeight.bold)),
    ));
  }
}
