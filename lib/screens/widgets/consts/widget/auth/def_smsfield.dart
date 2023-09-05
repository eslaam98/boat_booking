import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class DefSmsField extends StatelessWidget {
  final void Function(String) onSubmit;
  final int? numberOfFields;
  const DefSmsField({super.key, required this.onSubmit, this.numberOfFields});

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OtpTextField(
          showCursor: false,
          autoFocus: false,
          fieldWidth: 50,
          textStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: isDarkModeEnabled ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(50),
          numberOfFields: numberOfFields ?? 5,
          enabledBorderColor: AppColors.lightColor3,
          borderColor:
              isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor,
          focusedBorderColor: AppColors.customappColors,
          showFieldAsBox: true,
          borderWidth: 2.0,
          decoration:
              const InputDecoration(hintTextDirection: TextDirection.ltr),
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here if necessary
          },
          onSubmit: onSubmit),
    );
  }
}
