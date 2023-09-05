import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/user/account/editaccount_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/customformfieldthree.dart';
import 'package:boat_booking/screens/widgets/consts/widget/profile_image.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAccountControllerImp());
    return GetBuilder<EditAccountControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Form(
                    key: controller.formstate,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const Icon(
                          Ionicons.remove,
                          size: 50,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75)),
                            alignment: Alignment.center,
                            height: 150.h,
                            width: 150.w,
                            child: Stack(children: [
                              GetBuilder<EditAccountControllerImp>(
                                  builder: (controller) => ProfileImage(
                                        onTap: () {
                                          controller.selectImage();
                                        },
                                        imageProfile: controller.image.isEmpty
                                            ? Container(
                                                color: Colors.white,
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                height: 200,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${ServerLink.linkImageUser}/${myHive!.get('userData')['user_image']}",
                                                ))
                                            : Image.memory(
                                                controller.webimage,
                                                fit: BoxFit.fill,
                                                width: double.infinity,
                                                height: 200,
                                              ),
                                      )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Iconsax.edit_25,
                                    size: 26,
                                    color: AppColors.lightColor,
                                  ))
                            ])),
                        CustomTextCuption(
                            textAlign: TextAlign.center,
                            title:
                                controller.image.isEmpty ? '71'.tr : '101'.tr),
                        SizedBox(
                          height: 50.h,
                        ),
                        const CustomTextCuption(
                            fontSize: 13, color: Colors.grey, title: 'الاسم'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormFieldThree(
                          controller: controller.username,
                          title: "ادخل الاسم",
                          prefixIcon: const Icon(
                            Ionicons.person_outline,
                            color: AppColors.customappColors,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextCuption(
                            fontSize: 13,
                            color: Colors.grey,
                            title: 'رقم الجوال'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormFieldThree(
                          controller: controller.phone,
                          title: "ادخل رقم الجوال",
                          prefixIcon: const Icon(
                            Iconsax.call_calling,
                            color: AppColors.customappColors,
                          ),
                          suffixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomTextCuption(fontSize: 13, title: '966+'),
                              Icon(
                                Iconsax.arrow_down_14,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const CustomTextCuption(
                            fontSize: 13,
                            color: Colors.grey,
                            title: "البريد الالكتروني"),
                        const SizedBox(
                          height: 5,
                        ),
                        const CustomTextCuption(
                            fontSize: 10,
                            color: Colors.red,
                            title: "ملحوظة تم تأكيد البريد لايمكن تغييره"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormFieldThree(
                          controller: TextEditingController(
                              text: myHive!.get('userData')['user_email']!),
                          title: "البريد الالكتروني",
                          prefixIcon: const Icon(
                            Ionicons.mail_outline,
                            color: AppColors.customappColors,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomButton(
                            textcolor: Colors.white,
                            buttoncolor: AppColors.customappColors,
                            title: "حفظ",
                            onPressed: () {
                              controller.editAccount();
                            })
                      ],
                    )))));
  }
}
