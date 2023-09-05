import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';

bool isDarkModeEnabled = sharedService.sharedPref.getBool('isDark') ?? false;

class AppTextData {
  AppTextData._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontNameEnglish = 'Open Sans';

  static const String fontNameArabic = 'Cairo';
  static const String fontNameArabicTwo = 'El Messiri';

  static TextTheme textTheme = TextTheme(
    displayLarge: smallStyle,
    displayMedium: mediumStyle,
    displaySmall: largeStyle,
    headlineMedium: display1,
    headlineSmall: headline,
    titleLarge: title,
    titleSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );
  static TextStyle smallStyle = const TextStyle();
  static TextStyle mediumStyle = const TextStyle();

  static TextStyle largeStyle = const TextStyle();

  static TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: AppFontStyle.fontStyle,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: AppFontStyle.fontStyle,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: AppFontStyle.fontStyle,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: AppFontStyle.fontStyle,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: AppFontStyle.fontStyle,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: AppFontStyle.fontStyle,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: AppFontStyle.fontStyle,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  //  ThemeData englishTheme = ThemeData(
  //   scaffoldBackgroundColor:
  //       isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
  //   backgroundColor:
  //       isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
  //   fontFamily: 'Open Sans',
  // );
  // ThemeData arabicTheme = ThemeData(
  //   scaffoldBackgroundColor:
  //       isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
  //   backgroundColor:
  //       isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
  //   fontFamily: 'Cairo',
  // );
}
