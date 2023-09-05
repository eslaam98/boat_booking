import 'package:boat_booking/config/themes/app_text_theme.dart';
import 'package:boat_booking/utils/constants/fsmsconfig.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  SharedService sharedService = Get.find();
  int? currentPage = 0;
  String? firstScreenSettings;
  ThemeData appThemeData = appThemeModde;
  bool isDarkModeEnabled = SaveMode.getModeTheme(key: 'isDark') ?? false;
  changeLang(String langeCode) {
    Locale local = Locale(langeCode);
    sharedService.sharedPref.setString('language', langeCode);
    Get.changeTheme(appThemeData);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fsmsconfig();

    String? sharedPrefLang = sharedService.sharedPref.getString('language');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appThemeData = appThemeModde;
    } else {
      if (sharedPrefLang == 'en') {
        language = const Locale('en');
        appThemeData = appThemeModde;
      } else {
        language = const Locale("ar");
        appThemeData = appThemeModde;
      }
    }

    super.onInit();
  }
}
