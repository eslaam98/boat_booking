import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/pages/policy/customtext_details_widget.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
            const CustomTextCuption(fontSize: 16, title: "سياسة الخصوصية"),
            SizedBox(
              height: 30.h,
            ),
            const CustomTextCuption(
                color: AppColors.kPrimaryColor,
                fontSize: 14,
                title: "جمع المعلومات الشخصية"),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextdetailsWidget(
                title:
                    "نحن نجمع بعض المعلومات الشخصية التي يقدمها لنا المستخدمون بشكل طوعي عند استخدام تطبيق حجز القوارب لدينا. تتضمن المعلومات الشخصية عادة الاسم وعنوان البريد الإلكتروني ورقم الهاتف ومعلومات الدفع. نستخدم هذه المعلومات فقط لتقديم خدمات الحجز وتحسين تجربة المستخدم."),
            SizedBox(height: 10.h),
            const CustomTextCuption(
                color: AppColors.kPrimaryColor,
                fontSize: 14,
                title: "استخدام المعلومات"),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextdetailsWidget(
                title:
                    "نستخدم المعلومات الشخصية التي نجمعها لتسهيل عمليات الحجز وتحسين جودة الخدمة التي نقدمها. قد نستخدم المعلومات أيضًا للتواصل مع المستخدمين بشأن حجوزاتهم أو تقديم عروض وتحديثات تهمهم."),
            SizedBox(height: 10.h),
            const CustomTextCuption(
                color: AppColors.kPrimaryColor,
                fontSize: 14,
                title: "مشاركة المعلومات"),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextdetailsWidget(
                title:
                    "نحن لا نشارك المعلومات الشخصية التي نجمعها مع أي جهات خارجية طرفًا لأغراض التسويق أو التجارة. قد نشارك بعض المعلومات مع شركاءنا الخدمين لتحسين عمليات الحجز وتقديم الخدمات بشكل فعال."),
            SizedBox(height: 10.h),
            const CustomTextCuption(
                color: AppColors.kPrimaryColor,
                fontSize: 14,
                title: "حماية المعلومات الشخصية"),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextdetailsWidget(
                title:
                    "نحن نحتفظ بالمعلومات الشخصية التي نجمعها بشكل آمن ووفقًا للمعايير الصناعية المعترف بها. نحن نسعى جاهدين لحماية المعلومات الشخصية من الوصول غير المصرح به والاستخدام غير القانوني أو التغيير غير المصرح به."),
            SizedBox(height: 10.h),
            const CustomTextCuption(
                color: AppColors.kPrimaryColor,
                fontSize: 14,
                title: " الاتصال بنا"),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextdetailsWidget(
                title:
                    "إذا كان لديك أي استفسارات أو أسئلة حول سياسة الخصوصية الخاصة بنا أو استخدام المعلومات الشخصية، يرجى الاتصال بنا عبر [البريد الإلكتروني أو رقم الهاتف]."),
            SizedBox(
              height: 30.h,
            ),
          ])),
    );
  }
}
