import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/pages/auth/signup/signup_page.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_textbotton.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DefSignUpWidget extends StatelessWidget {
  const DefSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              CustomBottomSheet.show(
                context,
                const SignupPage(),
                0.8,
              );
            },
            icon: const Icon(
              Iconsax.arrow_up_24,
              size: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextCuption(
                fontSize: 17,
                title: "لا أملك حساب التطبيق؟",
                color: AppColors.darkColor,
              ),
              const SizedBox(
                width: 1,
              ),
              CustomTextBotton(
                  fontWeight: FontWeight.bold,
                  onPressed: () {
                    CustomBottomSheet.show(
                      context,
                      const SignupPage(),
                      0.8,
                    );
                  },
                  title: '15'.tr,
                  color: AppColors.customappColors,
                  mainAxisAlignment: MainAxisAlignment.center),
            ],
          ),
        ],
      ),
    );
  }
}
