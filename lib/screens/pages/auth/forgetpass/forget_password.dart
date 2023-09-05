import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/forgetpassword/forget_password_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/app_textfield.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/customgreen_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:boat_booking/utils/constants/valitype.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor:
          isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Form(
                        key: controller.formstate,
                        child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              CustomAppBar(
                                title: Image.asset(AppImageAsset.logoImage),
                                widgetBar: const CustomTextStyle(title: ''),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Column(children: [
                                  SizedBox(
                                    height: 70.h,
                                  ),
                                  const CustomTextStyle(
                                    title: "نسيت كلمة السر",
                                    fontSize: 20,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const CustomTextCuption(
                                    textAlign: TextAlign.center,
                                    title:
                                        "سيتم ارسال رسالة برمز التفعيل لحسابك خلال 3 دقائق تفقد صندوق البريدالالكتروني الخاص بك أو الرسائل العشوائية",
                                    fontSize: 12,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  AppTextField(
                                    borderColor: Colors.grey,
                                    titleColors: Colors.black,
                                    validator: (val) {
                                      return validInput(val!, 5, 100, "email");
                                    },
                                    keyboardTypE: TextInputType.emailAddress,
                                    controlleR: controller.email,
                                    title: '11'.tr,
                                    suffixIcoN: const Icon(Iconsax.sms,
                                        color: AppColors
                                            .customappColorsIcons //icon color

                                        ),
                                    obscureText: false,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 80.h,
                                  ),
                                  CustomgreenButton(
                                    title: "ارسال",
                                    onPressed: () {
                                      controller.checkemail();
                                    },
                                  ),
                                  SizedBox(
                                    height: 100.h,
                                  ),
                                ]),
                              )
                            ]))),
              )),
    );
  }
}
