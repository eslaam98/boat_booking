import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonInfoPage extends StatelessWidget {
  const PersonInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            CustomAppBar(
                title: Image.asset(
                  AppImageAsset.logoImage,
                  // height: 80.h,
                ),
                widgetBar: const Text('')),
            SizedBox(
              height: 20.h,
            ),
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1ab5b3),
                ),
                height: 110.h,
                width: Get.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Image.asset(
                      AppImageAsset.logoContainerStyle,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                )),
            SizedBox(
              height: 30.h,
            ),
            CustomTextCuption(fontSize: 16, title: "من نحن")
          ])),
    );
  }
}
