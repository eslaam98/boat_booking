import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescTextField extends StatelessWidget {
  final TextEditingController? controlleR;
  final TextInputType? keyboardTypE;
  final TextAlign textAlign = TextAlign.start;
  final Widget? prefixIcoN;
  final Widget? suffixIcoN;
  final String? helperText;
  final String title;
  const DescTextField({
    Key? key,
    required this.controlleR,
    this.keyboardTypE,
    required this.title,
    this.prefixIcoN,
    this.suffixIcoN,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;

    return TextFormField(
      textAlign: textAlign,
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
      maxLines: 2,
      keyboardType: keyboardTypE,
      decoration: InputDecoration(
        helperText: helperText,
        labelStyle: TextStyle(
          fontSize: 16.0,
          fontFamily: AppFontStyle.fontStyle,
          color: isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(
            color: AppColors.lightColor3,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
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
