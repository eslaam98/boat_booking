import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomgreenButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomgreenButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        clipBehavior: Clip.antiAlias,
        height: 60,
        minWidth: Get.width * 0.7,
        color: AppColors.customappColorstow,
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(
                letterSpacing: 0.5,
                fontFamily: AppFontStyle.fontStyle,
                color: AppColors.lightColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
