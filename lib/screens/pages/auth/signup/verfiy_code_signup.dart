import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/auth/verfiy/verfiycode_signup_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_textbotton.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/customgreen_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/screens/widgets/consts/widget/exit_app.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    Get.put(VerifyCodeSignUpControllerImp());

    return Scaffold(
        backgroundColor:
            isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<VerifyCodeSignUpControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            CustomAppBar(
                                title: Image.asset(AppImageAsset.logoImage),
                                widgetBar: const Text('')),
                            const SizedBox(
                              height: 50,
                            ),
                            const CustomTextStyle(
                              fontSize: 25,
                              title: "تأكيد رقم الهاتف",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            const CustomTextCuption(
                              textAlign: TextAlign.center,
                              title:
                                  'يرجي ادخال الرقم المرسل علي الجوال لتسجيل الدخول',
                              fontSize: 13,
                              color: AppColors.kPrimaryColor,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: OtpTextField(
                                showCursor: false,
                                autoFocus: false,
                                fieldWidth: 50,
                                textStyle: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkModeEnabled
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                numberOfFields: 5,
                                enabledBorderColor: AppColors.lightColor3,
                                borderColor: isDarkModeEnabled
                                    ? AppColors.lightColor
                                    : AppColors.darkColor,
                                focusedBorderColor: AppColors.customappColors,
                                showFieldAsBox: true,
                                borderWidth: 2.0,
                                decoration: const InputDecoration(
                                    hintTextDirection: TextDirection.ltr),
                                //runs when a code is typed in
                                onCodeChanged: (String code) {
                                  //handle validation or checks here if necessary
                                },
                                onSubmit: (String verificationCode) {
                                  controller
                                      .goToSuccessSignUp(verificationCode);
                                }, // end onSubmit
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CustomgreenButton(
                              title: "ارسال",
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomTextCuption(
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    title: "لم تصلك رسالة حتي الان؟"),
                                CustomTextBotton(
                                    onPressed: () {
                                      controller.resendC();
                                    },
                                    title: 'اعادة الارسال',
                                    color: AppColors.customappColors,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ))));
  }
}
