import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void logOutDialogWidget(BuildContext context) {
  var awesomeDialog = AwesomeDialog(
    dialogBackgroundColor: Colors.white,
    btnOkOnPress: () {
      String userID = sharedService.sharedPref.getString('user_id')!;
      FirebaseMessaging.instance.unsubscribeFromTopic('users');
      FirebaseMessaging.instance.unsubscribeFromTopic('users${userID}');
      sharedService.sharedPref.clear();
      Get.offAllNamed(AppRoute.loginPage);
    },
    btnCancelOnPress: () {},
    context: context,
    animType: AnimType.bottomSlide,
    dialogType: DialogType.question,
    btnOkText: '112'.tr,
    btnCancelText: '113'.tr,
    body: Center(
      child: Text(
        '111'.tr,
        style: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontSize: 17,
        ),
      ),
    ),
  );
  awesomeDialog.show();
}
