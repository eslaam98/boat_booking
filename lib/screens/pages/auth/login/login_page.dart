import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/auth/login/login_controller.dart';
import 'package:boat_booking/screens/widgets/consts/widget/drawer/drawer_screen.dart';
import 'package:boat_booking/screens/widgets/animation/custom_animation.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/app_textfield.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button_tow.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_textbotton.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_tow.dart';
import 'package:boat_booking/screens/widgets/consts/widget/auth/def_signup_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/exit_app.dart';
import 'package:boat_booking/utils/constants/valitype.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.lightColor,
          title: Image.asset(
            AppImageAsset.logoImage,
            height: 70.h,
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Stack(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: AppColors.customappColors,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              )),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Form(
                              key: controller.formstate,
                              child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    const Icon(
                                      Ionicons.remove,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomAnimation(
                                      widget: CustomTextTow(
                                        title: '12'.tr,
                                        fontSize: 20,
                                      ),
                                      millisecond: 1200,
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    AppTextField(
                                      color: Colors.white,
                                      obscureText: false,
                                      controlleR: controller.email,
                                      title: "الايميل",
                                      suffixIcoN: const Icon(
                                          Ionicons.mail_outline,
                                          color: AppColors.lightColor),
                                      validator: (val) {
                                        return validInput(
                                            val!, 5, 100, "email");
                                      },
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    GetBuilder<LoginControllerImp>(
                                      builder: (controller) => AppTextField(
                                        color: Colors.white,
                                        validator: (val) {
                                          return validInput(
                                              val!, 3, 30, "password");
                                        },
                                        controlleR: controller.password,
                                        keyboardTypE:
                                            TextInputType.visiblePassword,
                                        obscureText: controller.isshowpassword,
                                        title: '5'.tr,
                                        suffixIcoN: const Icon(Iconsax.lock,
                                            color: AppColors.lightColor),
                                        prefixIcoN: IconButton(
                                          color: AppColors.lightColor,
                                          icon: controller.isshowpassword
                                              ? controller.visibleOff
                                              : controller.visible,
                                          onPressed: () {
                                            controller.showPassword();
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextBotton(
                                        fontWeight: FontWeight.bold,
                                        onPressed: () {
                                          controller.goToForgetPassword();
                                        },
                                        title: '13'.tr,
                                        color: AppColors.lightColor,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      height: 55,
                                      title: '12'.tr,
                                      onPressed: () {
                                        controller.login();
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomButtonTow(
                                      sideColor: Colors.white,
                                      height: 55,
                                      title: "الدخول كزائر",
                                      onPressed: () {
                                        Get.to(() => const DrawerScreen());
                                      },
                                    ),
                                    const SizedBox(height: 40),
                                  ]))),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                              height: 100.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              child: DefSignUpWidget()))
                    ],
                  )),
            )));
  }
}
