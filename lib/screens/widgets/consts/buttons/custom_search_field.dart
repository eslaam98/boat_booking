import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controlleR;
  final void Function(String) onChanged;
  final void Function() pressedOnSearchIcon;
  final void Function()? onPressedFilterIcon;
  final void Function()? onTap;

  const CustomSearchField({
    Key? key,
    required this.controlleR,
    required this.onChanged,
    required this.pressedOnSearchIcon,
    this.onPressedFilterIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;

    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
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
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.lightColor3),
        ),
        hintText: "بحث",
        hintStyle: TextStyle(
            fontFamily: AppFontStyle.fontStyle,
            color:
                isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
        prefixIcon: IconButton(
          icon: const Icon(
            Ionicons.search_outline,
            color: AppColors.customappColorsIcons,
          ),
          onPressed: pressedOnSearchIcon,
        ),
        suffixIcon: IconButton(
            icon: SvgPicture.asset(
              AppImageAsset.filtericon,
              color: AppColors.customappColors,
            ),
            onPressed: onPressedFilterIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
