import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/account/changepass_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_formfieldtow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePaasControllerImp());
    return GetBuilder<ChangePaasControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                          fontSize: 15, title: 'تغيير كلمة السر'),
                      SizedBox(
                        height: 15.h,
                      ),
                      const CustomTextCuption(
                          fontSize: 13,
                          color: Colors.grey,
                          title: 'كلمة المرور القديمة'),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomFormFieldTow(
                          obscureText: controller.isshowpassword,
                          controlleR: controller.oldPassword,
                          title: 'كلمة مرور',
                          suffixIcoN: const Icon(Iconsax.lock,
                              color: AppColors.customappColors),
                          prefixIcoN: IconButton(
                            onPressed: () {
                              controller.showPassword();
                            },
                            color: AppColors.customappColors,
                            icon: controller.isshowpassword
                                ? controller.visibleOff
                                : controller.visible,
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomTextCuption(
                          fontSize: 13,
                          color: Colors.grey,
                          title: 'كلمة المرور الجديدة'),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomFormFieldTow(
                          obscureText: controller.isshowpasswordTow,
                          controlleR: controller.newPassword,
                          title: 'كلمة مرور',
                          suffixIcoN: const Icon(Iconsax.lock,
                              color: AppColors.customappColors),
                          prefixIcoN: IconButton(
                            onPressed: () {
                              controller.showPasswordTow();
                            },
                            color: AppColors.customappColors,
                            icon: controller.isshowpasswordTow
                                ? controller.visibleOff
                                : controller.visible,
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomTextCuption(
                          fontSize: 13,
                          color: Colors.grey,
                          title: 'تأكيد كلمة المرور الجديدة'),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomFormFieldTow(
                          obscureText: controller.isshowpasswordThree,
                          controlleR: controller.reNewPassword,
                          title: 'كلمة مرور',
                          suffixIcoN: const Icon(Iconsax.lock,
                              color: AppColors.customappColors),
                          prefixIcoN: IconButton(
                            onPressed: () {
                              controller.showPasswordThree();
                            },
                            color: AppColors.customappColors,
                            icon: controller.isshowpasswordThree
                                ? controller.visibleOff
                                : controller.visible,
                          )),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButton(
                          textcolor: Colors.white,
                          buttoncolor: AppColors.customappColors,
                          title: "ارسال",
                          onPressed: () {
                            controller.changePassword();
                          })
                    ],
                  ),
                ))));
  }
}
