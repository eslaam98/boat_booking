import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class SuccessWidget extends StatelessWidget {
  final String title;
  final String captiontitle;

  const SuccessWidget(
      {super.key, required this.title, required this.captiontitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          const Icon(
            Ionicons.remove,
            size: 50,
          ),
          Lottie.asset(AppImageAsset.successlottie, height: 180.h),
          SizedBox(
            height: 5.h,
          ),
          CustomTextCuption(
              fontSize: 18, textAlign: TextAlign.center, title: title),
          SizedBox(
            height: 6.h,
          ),
          CustomTextCuption(
              color: Colors.grey,
              fontSize: 13,
              textAlign: TextAlign.center,
              title: captiontitle),
          SizedBox(
            height: 30.h,
          ),
          CustomButton(
              textcolor: Colors.white,
              buttoncolor: AppColors.customappColorstow,
              title: "موافق",
              onPressed: () {
                Navigator.maybePop(context);
              })
        ]));
  }
}
