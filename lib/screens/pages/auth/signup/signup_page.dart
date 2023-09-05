import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/auth/signup/signup_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/app_textfield.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_textbotton.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/customgreen_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/profile_image.dart';
import 'package:boat_booking/utils/constants/valitype.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;
    Get.put(SignUpControllerImp());
    return GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  IconButton(
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                      icon: const Icon(
                        Ionicons.remove,
                        size: 50,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextStyle(
                      textAlign: TextAlign.center, title: "انشاء حساب جديد"),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<SignUpControllerImp>(
                    builder: (controller) => ProfileImage(
                      imageProfile: controller.image.isEmpty
                          ? Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 200,
                              child: const Icon(
                                Ionicons.person_circle_outline,
                                size: 50,
                                color: Colors.grey,
                              ))
                          : Image.memory(
                              controller.webimage,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 200,
                            ),
                      onTap: () {
                        controller.selectImage();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextCuption(
                      textAlign: TextAlign.center,
                      title: controller.image.isEmpty ? '71'.tr : '101'.tr),
                  const SizedBox(
                    height: 40,
                  ),
                  AppTextField(
                      titleColors: Colors.black,
                      color: Colors.grey,
                      validator: (val) {
                        return validInput(val!, 3, 30, "name");
                      },
                      controlleR: controller.username,
                      keyboardTypE: TextInputType.emailAddress,
                      title: '16'.tr,
                      suffixIcoN: const Icon(Ionicons.person_outline,
                          color: AppColors.customappColorsIcons),
                      obscureText: false),
                  const SizedBox(height: 20),
                  AppTextField(
                      titleColors: Colors.black,
                      color: Colors.grey,
                      validator: (val) {
                        return validInput(val!, 3, 40, "email");
                      },
                      controlleR: controller.email,
                      keyboardTypE: TextInputType.emailAddress,
                      title: '11'.tr,
                      suffixIcoN: const Icon(
                        Iconsax.sms,
                        color: AppColors.customappColorsIcons,
                      ),
                      obscureText: false),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                      titleColors: Colors.black,
                      color: Colors.grey,
                      validator: (val) {
                        return validInput(val!, 7, 11, "phone");
                      },
                      controlleR: controller.phone,
                      keyboardTypE: TextInputType.phone,
                      title: '30'.tr,
                      suffixIcoN: const Icon(Iconsax.call,
                          color: AppColors.customappColorsIcons),
                      obscureText: false),
                  const SizedBox(height: 20),
                  AppTextField(
                    titleColors: Colors.black,
                    color: Colors.grey,
                    validator: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    controlleR: controller.password,
                    keyboardTypE: TextInputType.emailAddress,
                    title: '5'.tr,
                    obscureText: controller.isshowpassword,
                    suffixIcoN: const Icon(
                      Iconsax.lock,
                      color: AppColors.customappColorsIcons,
                    ),
                    prefixIcoN: IconButton(
                        color: AppColors.customappColorsIcons,
                        icon: controller.isshowpassword
                            ? controller.visibleOff
                            : controller.visible,
                        onPressed: () {
                          controller.showPassword();
                        }),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    titleColors: Colors.black,
                    color: Colors.grey,
                    validator: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    controlleR: controller.repassword,
                    keyboardTypE: TextInputType.emailAddress,
                    title: "تأكيد كلمة السر",
                    obscureText: controller.isshowpasswordtwo,
                    suffixIcoN: const Icon(
                      Iconsax.lock,
                      color: AppColors.customappColorsIcons,
                    ),
                    prefixIcoN: IconButton(
                        color: AppColors.customappColorsIcons,
                        icon: controller.isshowpasswordtwo
                            ? controller.visibleOff
                            : controller.visible,
                        onPressed: () {
                          controller.showPasswordtwo();
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          activeColor: Colors.teal[50],
                          checkColor: AppColors.customappColors,
                          value: controller.policyandrolles,
                          onChanged: (policyandrolles) {
                            controller.policyandrollesShow();
                          }),
                      const CustomTextCuption(
                        fontSize: 13,
                        title: "أوافق علي ",
                      ),
                      CustomTextBotton(
                          fontWeight: FontWeight.normal,
                          onPressed: () {
                            Get.toNamed(AppRoute.privacyPolicyPage);
                          },
                          title: "الشروط وسياسة الخصوصية",
                          color: AppColors.customappColors,
                          mainAxisAlignment: MainAxisAlignment.center),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomgreenButton(
                    title: '15'.tr,
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(height: 30),
                ]),
              ),
            )));
  }
}
