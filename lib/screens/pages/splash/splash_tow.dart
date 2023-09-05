import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashTow extends StatelessWidget {
  const SplashTow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/b7ffe663-f2e6-462c-9ae6-24c1de95b38f.png',
              width: Get.width,
              height: Get.height,
              fit: BoxFit.fill,
            ),
            Positioned(
                top: 35.h,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/1ae802ef-3d67-436d-ac7c-7fd2ade79448.png',
                  // width: 50.w,
                  // height: 200,
                  fit: BoxFit.scaleDown,
                )),
            Positioned(
              bottom: 36.h,
              left: 0,
              right: 0,
              child: Center(
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 10.w, color: Color(0xFF1b7d7e)),
                          borderRadius: BorderRadius.circular(80.0)),
                      height: 80,
                      minWidth: 80,
                      color: AppColors.darkColor,
                      onPressed: () {
                        Get.offAllNamed(AppRoute.loginPage);
                      },
                      child: Text("ابدأ",
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: AppFontStyle.fontStyle,
                              color: AppColors.lightColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)))),
            )
          ],
        ),
      ),
    );
  }
}
