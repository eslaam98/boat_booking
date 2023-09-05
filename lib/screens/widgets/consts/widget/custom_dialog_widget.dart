import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customDialogWidget(
    BuildContext context, void Function() btnOkOnPress, String title) {
  bool isDarkModeEnabled = sharedService.sharedPref.getBool('isDark') ?? false;
  var awesomeDialog = AwesomeDialog(
    dialogBackgroundColor: isDarkModeEnabled ? Colors.grey : Colors.white,
    btnOkOnPress: btnOkOnPress,
    btnCancelOnPress: () {},
    context: context,
    animType: AnimType.bottomSlide,
    dialogType: DialogType.question,
    btnOkText: '112'.tr,
    btnCancelText: '113'.tr,
    body: Center(
      child: Text(
        title,
        style: TextStyle(
          color: isDarkModeEnabled ? Colors.white : Colors.black,
          fontStyle: FontStyle.italic,
          fontSize: 20,
        ),
      ),
    ),
  );
  awesomeDialog.show();
}
