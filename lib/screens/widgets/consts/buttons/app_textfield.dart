import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controlleR;
  final TextInputType? keyboardTypE;
  final bool obscureText;
  final TextAlign textAlign = TextAlign.start;
  final Widget? prefixIcoN;
  final Widget? suffixIcoN;
  final String? helperText;
  final String? Function(String?) validator;
  final String title;
  final Color color;
  final Color? titleColors;
  final Color? borderColor;

  const AppTextField({
    Key? key,
    required this.controlleR,
    this.keyboardTypE,
    required this.title,
    this.prefixIcoN,
    this.suffixIcoN,
    required this.obscureText,
    required this.validator,
    this.helperText,
    required this.color,
    this.titleColors,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;

    return TextFormField(
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: AppFontStyle.fontStyle,
          color: titleColors ?? AppColors.lightColor),
      controller: controlleR,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardTypE,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: color,
          ),
        ),
        helperText: helperText,
        labelStyle: TextStyle(fontFamily: AppFontStyle.fontStyle, color: color),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        //   borderSide: BorderSide(
        //     color: isDarkModeEnabled
        //         ? AppColors.greyCardColor
        //         : AppColors.lightblueColor,
        //   ),
        // ),
        // disabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white, width: 1.0),
        // ),
        // filled: true,
        // fillColor:
        //     isDarkModeEnabled ? AppColors.greyCardColor : AppColors.lightColor3,
        labelText: title,
        hintText: '${'46'.tr} $title',
        hintStyle: TextStyle(
            fontFamily: AppFontStyle.fontStyle, color: AppColors.lightColor),
        prefixIcon: prefixIcoN,
        suffixIcon: suffixIcoN,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
