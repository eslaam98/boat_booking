import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageStyle extends StatelessWidget {
  final Widget widget;
  const CustomImageStyle({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.02,
      ),
      child: SizedBox(
        height: 75,
        width: 75,
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            color: isDarkModeEnabled
                ? AppColors.greyCardColor
                : AppColors.lightColor3,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Center(
            child: widget,
          ),
        ),
      ),
    );
  }
}
