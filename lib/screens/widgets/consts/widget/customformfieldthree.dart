import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormFieldThree extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomFormFieldThree(
      {super.key,
      required this.controller,
      required this.title,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontFamily: AppFontStyle.fontStyle, color: AppColors.darkColor),
      controller: controller,
      validator: (validator) {
        if (validator!.isEmpty) {
          return '104'.tr;
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.lightColor3),
        ),
        hintText: title,
        hintStyle: TextStyle(
            fontSize: 15,
            fontFamily: AppFontStyle.fontStyle,
            color: AppColors.darkColor),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
