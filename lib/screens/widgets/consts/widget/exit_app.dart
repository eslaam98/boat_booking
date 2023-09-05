import 'dart:io';

import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

bool isDarkModeEnabled = sharedService.sharedPref.getBool('isDark') ?? false;
Future<bool> alertExitApp() {
  Get.defaultDialog(
      backgroundColor: const Color.fromRGBO(222, 220, 200, 150),
      radius: 50,
      title: '',
      content: Lottie.asset(AppImageAsset.question),
      actions: [
        const Text(
          'Are You Want to Exit App?',
          style: TextStyle(
              color: AppColors.lightColor,
              fontSize: 25,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 50,
            minWidth: 50,
            color: AppColors.redColor,
            child: const Text('Ok',
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              exit(0);
            },
          ),
          const SizedBox(
            width: 15,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 50,
            minWidth: 50,
            color: AppColors.greenColor3,
            child: const Text('Cancel',
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.back();
            },
          ),
        ])
      ]);
  return Future.value(true);
}
