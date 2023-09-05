import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';

bool isDarkModeEnabled = sharedService.sharedPref.getBool('isDark') ?? false;
ThemeData appThemeModde = ThemeData(
  appBarTheme: AppBarTheme(
      elevation: 0,
      color: isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor),
  primaryColor: AppColors.customappColors,
  // badgeTheme:BadgeThemeData(

  // ),
  scaffoldBackgroundColor:
      isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
  iconTheme: IconThemeData(
      color: isDarkModeEnabled ? AppColors.greyColor : AppColors.kPrimaryColor),
  fontFamily: AppFontStyle.fontStyle,
  textTheme: TextTheme(
      labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          color:
              // isDarkModeEnabled ?
              AppColors.orangeStyleColor),
      labelMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color:
              //  isDarkModeEnabled ?
              AppColors.orangeStyleColor
          // : AppColors.darkColor
          ),
      labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
      displaySmall: TextStyle(
          fontSize: 12,
          color:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
      displayMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
      displayLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
      bodyMedium: TextStyle(
          fontSize: 17,
          color:
              isDarkModeEnabled ? AppColors.greyColor : AppColors.lightColor),
      bodyLarge: TextStyle(
          fontSize: 25,
          color: isDarkModeEnabled ? AppColors.greyColor : AppColors.lightColor,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w200,
          color:
              isDarkModeEnabled ? AppColors.greyColor : AppColors.lightColor),
      titleSmall: const TextStyle(
          fontSize: 12,
          color:
              // isDarkModeEnabled
              //     ? AppColors.blueStyleColor2
              //     :
              AppColors.blueStyleColor3),
      titleMedium: TextStyle(
          fontSize: 17,
          color:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor),
      titleLarge: TextStyle(
          fontSize: 20,
          color:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor)),

  primarySwatch: Colors.teal,
);
