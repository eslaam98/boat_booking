import 'package:boat_booking/domain/controller/user/account/verfiy_account_controller.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/auth/def_smsfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class VerifyPhonePage extends StatelessWidget {
  const VerifyPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyAccountControllerImp());
    return GetBuilder<VerfiyAccountControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Form(
                key: controller.formstate,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const Icon(
                      Ionicons.remove,
                      size: 50,
                    ),
                    const CustomTextCuption(
                        textAlign: TextAlign.start,
                        fontSize: 15,
                        title: 'توثيق الحساب'),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefSmsField(
                        onSubmit: (String verificationCode) {
                          controller.verifyCode(verificationCode);
                        },
                        numberOfFields: 6,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ))));
  }
}
