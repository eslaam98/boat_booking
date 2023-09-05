import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormFieldTow extends StatelessWidget {
  final TextEditingController controlleR;
  final bool obscureText;

  final Widget? prefixIcoN;
  final Widget? suffixIcoN;
  final String? helperText;
  final String title;
  const CustomFormFieldTow({
    Key? key,
    required this.controlleR,
    this.prefixIcoN,
    this.suffixIcoN,
    this.helperText,
    required this.title,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;

    return TextFormField(
      style: TextStyle(
          fontFamily: AppFontStyle.fontStyle,
          color:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
      controller: controlleR,
      validator: (validator) {
        if (validator!.isEmpty) {
          return '104'.tr;
        }
        return null;
      },
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.lightColor3),
        ),
        hintText: title,
        hintStyle: TextStyle(
            fontFamily: AppFontStyle.fontStyle,
            color:
                isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
        prefixIcon: prefixIcoN,
        suffixIcon: suffixIcoN,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
