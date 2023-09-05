import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/suggest/suggest_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/desc_textfield.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/screens/widgets/consts/widget/customformfieldthree.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class ConnectUsPage extends StatelessWidget {
  const ConnectUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuggestControllerImp());
    return Scaffold(
        backgroundColor: AppColors.lightColor,
        body: GetBuilder<SuggestControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                        key: controller.formstate,
                        child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      const Icon(
                                        Ionicons.mail_outline,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextCuption(
                                              title: 'البريد الالكتروني',
                                              color: Colors.white,
                                              fontSize: 15),
                                          CustomTextCuption(
                                              fontFamily: 'Open Sans',
                                              title: "yahtapp@gmail.com",
                                              color: Colors.white,
                                              fontSize: 12),
                                        ],
                                      ),
                                      const Icon(
                                        Iconsax.call_calling,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const CustomTextCuption(
                                              title: 'رقم الجوال',
                                              color: Colors.white,
                                              fontSize: 15),
                                          CustomTextCuption(
                                              fontFamily: 'Open Sans',
                                              title:
                                                  "${myHive!.get('userData')['user_phone']}",
                                              color: Colors.white,
                                              fontSize: 12),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: 20.h,
                              ),
                              const CustomTextCuption(
                                fontSize: 15,
                                title: "نسعد باستقبال ارائكم واقتراحاتكم",
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const CustomTextCuption(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  title: 'الاسم'),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomFormFieldThree(
                                controller: controller.suggestUsername,
                                title: "الاسم",
                                prefixIcon: const Icon(
                                  Ionicons.person_outline,
                                  color: AppColors.customappColors,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const CustomTextCuption(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  title: 'رقم الجوال'),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomFormFieldThree(
                                controller: controller.suggestUserPhone,
                                title: "ادخل رقم الجوال",
                                prefixIcon: const Icon(
                                  Iconsax.call_calling,
                                  color: AppColors.customappColors,
                                ),
                                suffixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CustomTextCuption(
                                        fontSize: 13, title: '+966'),
                                    IconButton(
                                        icon: const Icon(
                                          Iconsax.arrow_down_14,
                                          color: AppColors.greyColor,
                                        ),
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const CustomTextCuption(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  title: 'العنوان'),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomFormFieldThree(
                                controller: controller.suggestType,
                                title: "اختر نوع الرسالة",
                                suffixIcon: const Icon(Iconsax.arrow_left_24),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const CustomTextCuption(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  title: 'ملاحظات'),
                              const SizedBox(
                                height: 10,
                              ),
                              DescTextField(
                                prefixIcoN: const Icon(
                                  Iconsax.document_text,
                                  color: AppColors.customappColors,
                                ),
                                controlleR: controller.suggestDesc,
                                title: "اضف هنا",
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomButton(
                                  minWidth: Get.height,
                                  textcolor: Colors.white,
                                  buttoncolor: AppColors.customappColors,
                                  title: "ارسال",
                                  onPressed: () {
                                    controller.addSuggest();
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                            ]))))));
  }
}
