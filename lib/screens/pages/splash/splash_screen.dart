import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/screens/widgets/consts/widget/drawer/drawer_screen.dart';
import 'package:boat_booking/screens/pages/splash/splash_tow.dart';
import 'package:boat_booking/screens/widgets/animation/custom_animation.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/d3714f4a-00e3-41ad-898f-0560be426087.png",
              width: Get.width,
              height: Get.height,
              fit: BoxFit.fill,
            ),
            Positioned(
              child: AnimatedSplashScreen(
                duration: 1500,
                splash: Image.asset(
                  "assets/images/89fc5976-f0b1-4bc0-9a6f-2d388b20fc8a.png",
                ),
                backgroundColor: Colors.transparent,
                nextScreen: sharedService.sharedPref.getString('step') == "2"
                    ? const DrawerScreen()
                    : const SplashTow(),
                splashIconSize: 300,
                splashTransition: SplashTransition.sizeTransition,
              ),
            ),
            Positioned(
              bottom: 0.h,
              left: 0,
              right: 0,
              child: CustomAnimation(
                  widget: Lottie.asset(AppImageAsset.logoForSplash,
                      width: 150.w, height: 150.h),
                  millisecond: 1500),
            )
          ],
        ),
      ),

      // ),
    );
  }
}
