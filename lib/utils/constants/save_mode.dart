import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

SharedService sharedService = Get.find();

class SaveMode extends Equatable {
  static init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> putModeTheme({
    required String key,
    required bool value,
  }) async {
    return await sharedService.sharedPref.setBool(key, value);
  }

  static bool? getModeTheme({
    required String key,
  }) {
    return sharedService.sharedPref.getBool(key) ?? false;
  }

  ThemeMode get themetogil => sharedService.sharedPref.getBool('isDark')!
      ? ThemeMode.dark
      : ThemeMode.light;

  @override
  List<Object?> get props => [];
}
