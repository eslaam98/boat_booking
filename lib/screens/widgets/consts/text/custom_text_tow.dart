import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextTow extends StatelessWidget {
  final String title;
  final double fontSize;
  const CustomTextTow({Key? key, required this.title, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          color: AppColors.lightColor,
          fontWeight: FontWeight.bold),
    );
  }
}
