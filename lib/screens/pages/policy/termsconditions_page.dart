import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/screens/pages/policy/customtext_details_widget.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

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
            const CustomTextCuption(fontSize: 16, title: "الشروط والاحكام"),
            SizedBox(
              height: 30.h,
            ),
            const CustomTextCuption(
                textAlign: TextAlign.center,
                fontSize: 14,
                title:
                    "نرجو من المستخدمين قراءة هذه الشروط والأحكام بعناية قبل استخدام التطبيق     ."),
            SizedBox(height: 20.h),
            const CustomTextdetailsWidget(
                title:
                    "يجب أن يكون المستخدم على عمر 18 عامًا أو أكثر لاستخدام هذا التطبيق"),
            SizedBox(height: 10.h),
            const CustomTextdetailsWidget(
                title:
                    "يتعين على المستخدم تقديم معلومات دقيقة وصحيحة عند حجز القوارب"),
            SizedBox(height: 10.h),
            const CustomTextdetailsWidget(
                title:
                    "نحتفظ بالحق في تغيير أو إلغاء حجوزات القوارب بناءً على توافرها"),
            SizedBox(height: 10.h),
            const CustomTextdetailsWidget(
                title:
                    "يجب أن يلتزم المستخدم بالقوانين المحلية المتعلقة بركوب القوارب والأنشطة ذات الصلة"),
            SizedBox(height: 10.h),
            const CustomTextdetailsWidget(
                title:
                    "يتم حفظ بيانات المستخدم بشكل آمن وفقًا لسياسية الخصوصية الخاصة بنا"),
            SizedBox(height: 10.h),
            const CustomTextdetailsWidget(
                title:
                    "قد تتم مراجعة شروط وأحكام التطبيق بشكل دوري ونحتفظ بالحق في تغييرها دون إشعار مسبق"),
            SizedBox(
              height: 30.h,
            ),
          ])),
    );
  }
}
