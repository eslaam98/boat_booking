import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/forgetpassword/verfiy_code_rp_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_textbotton.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/customgreen_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/auth/def_smsfield.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    Get.put(VerifyCodeControllerImp());

    return Scaffold(
      backgroundColor:
          isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
      body: GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomAppBar(
                    title: Image.asset(AppImageAsset.logoImage),
                    widgetBar: const CustomTextStyle(title: ''),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextCuption(
                    title: '22'.tr,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  DefSmsField(
                    onSubmit: (String verificationCode) {
                      controller.goToResetPassword(verificationCode);
                    },
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomgreenButton(
                    title: "ارسال",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextCuption(
                          textAlign: TextAlign.center,
                          title: "لم تصلك رسالة حتي الان؟"),
                      CustomTextBotton(
                          onPressed: () {
                            controller.resendC();
                          },
                          title: 'اعادة الارسال',
                          color: AppColors.customappColors,
                          mainAxisAlignment: MainAxisAlignment.center),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
