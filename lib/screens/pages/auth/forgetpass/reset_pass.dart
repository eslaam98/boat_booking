import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/forgetpassword/reset_password_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/screens/widgets/consts/widget/customformfieldthree.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;

    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor:
            isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        CustomAppBar(
                          title: Image.asset(AppImageAsset.logoImage),
                          widgetBar: const CustomTextStyle(title: ''),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomTextCuption(
                          title: "من فضلك ادخل كلمة السر الجديدة",
                          fontSize: 15,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomFormFieldThree(
                          controller: controller.password,
                          title: '24'.tr,
                          prefixIcon: const Icon(Iconsax.lock4,
                              color: AppColors.greyStyleColor),
                          suffixIcon: IconButton(
                            color: AppColors.greyStyleColor,
                            icon: controller.isshowpasswordtwo
                                ? controller.visible
                                : controller.visibleOff,
                            onPressed: () {
                              controller.showPasswordtwo();
                            },
                          ),
                          //: true
                          // controller.isshowpasswordtwo,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomFormFieldThree(
                          controller: controller.repassword,
                          title: '25'.tr,
                          prefixIcon: const Icon(Iconsax.lock4,
                              color: AppColors.greyStyleColor),
                          suffixIcon: IconButton(
                            color: AppColors.greyStyleColor,
                            icon: controller.isshowpasswordtwo
                                ? controller.visible
                                : controller.visibleOff,
                            onPressed: () {
                              controller.showPasswordtwo();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        CustomButton(
                          textcolor: Colors.white,
                          buttoncolor: AppColors.customappColors,
                          title: '26'.tr,
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
