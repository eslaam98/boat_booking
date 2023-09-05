import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/domain/controller/user/account/verfiy_account_controller.dart';
import 'package:boat_booking/screens/pages/account/verfiy_phone_page.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:boat_booking/screens/widgets/consts/widget/customformfieldthree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({super.key});

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
                        fontSize: 15, title: 'توثيق الحساب'),
                    SizedBox(
                      height: 15.h,
                    ),
                    const CustomTextCuption(
                        fontSize: 13, color: Colors.grey, title: 'رقم الجوال'),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomFormFieldThree(
                      controller: controller.phone,
                      title: "ادخل رقم الجوال",
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Iconsax.call_calling,
                          color: AppColors.customappColors,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                        textcolor: Colors.white,
                        buttoncolor: AppColors.customappColors,
                        title: "ارسال",
                        onPressed: () {
                          controller.sendSMS();
                          Navigator.maybePop(context);

                          controller.isCodeSent.value == true
                              ? CustomBottomSheet.show(
                                  Get.context!, const VerifyPhonePage(), 0.5)
                              : print("dds");
                        }),
                    SizedBox(
                      height: 40.h,
                    ),
                    // Obx(() => Visibility(
                    //       visible: controller.isCodeSent.value,
                    //       child: DefSmsField(
                    //         numberOfFields: 6,
                    //         onSubmit: (String verificationCode) {
                    //           controller.verifyCode(verificationCode);
                    //         },
                    //       ),
                    //     )),
                    // SizedBox(
                    //   height: 40.h,
                    // ),
                  ],
                ))));
  }
}
