import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/screens/pages/account/change_password_screen.dart';
import 'package:boat_booking/screens/pages/account/edit_account_screen.dart';
import 'package:boat_booking/screens/pages/account/verify_account.dart';
import 'package:boat_booking/screens/widgets/consts/widget/drawer/custom_draweritems_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/drawer/drawer_screen.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/rating_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/fullscreenimage_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/logout_widget.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customappColors,
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF1ab5b3),
              ),
              height: 100.h,
              width: Get.width * 0.8,
              child: ListTile(
                title: CustomTextCuption(
                  fontSize: 18,
                  color: Colors.white,
                  title: sharedService.sharedPref.getString('username') == null
                      ? "اسم المستخدم"
                      : '${sharedService.sharedPref.getString('username')}',
                ),
                subtitle: CustomTextCuption(
                  title: sharedService.sharedPref.getString('user_id') == null
                      ? 'رقم الجوال'
                      : '${myHive!.get('userData')['user_phone']}',
                  fontSize: 13,
                  textAlign: TextAlign.start,
                  color: Colors.white,
                ),
                leading: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(75)),
                    constraints: const BoxConstraints(maxWidth: 100),
                    alignment: Alignment.center,
                    height: 75.h,
                    width: 75.w,
                    child: Stack(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: sharedService.sharedPref
                                      .getString('username') ==
                                  null
                              ? Image.asset(
                                  "assets/images/bbc65116-917d-4301-9304-ef16e8dd4972.png")
                              : GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FullScreenImage(
                                            imageUrl:
                                                "${ServerLink.linkImageUser}/${myHive!.get('userData')['user_image']}",
                                          ),
                                        ));
                                  },
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "${ServerLink.linkImageUser}/${myHive!.get('userData')['user_image']}",
                                      height: 75,
                                      width: 75,
                                      fit: BoxFit.fill),
                                )),
                      const Positioned(
                          left: 0,
                          bottom: -4,
                          child: Icon(
                            Iconsax.verify5,
                            size: 26,
                            color: AppColors.blueStyleColor3,
                          ))
                    ])),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          CustomBottomSheet.show(
                              context, const EditAccountScreen(), 0.8);
                        },
                        icon: const Icon(
                          Iconsax.edit_25,
                          size: 25,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                CustomDrawerItemsWdget(
                    title: "الرئيسية",
                    icon: Ionicons.home_outline,
                    onTap: () {
                      zoomDrawerController.close?.call();
                    }),
                SizedBox(
                  height: 30.h,
                ),
                CustomDrawerItemsWdget(
                    title: "محفظتي",
                    icon: Ionicons.wallet_outline,
                    onTap: () {
                      Get.toNamed(AppRoute.walletPage);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "تواصل معنا",
                    icon: Ionicons.call,
                    onTap: () {
                      Get.toNamed(AppRoute.connectUsPage);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "من نحن",
                    icon: Ionicons.information_circle_outline,
                    onTap: () {
                      Get.toNamed(AppRoute.personInfoPage);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "توثيق الحساب",
                    icon: Iconsax.verify,
                    onTap: () {
                      CustomBottomSheet.show(
                          context, const VerifyAccount(), 0.5);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "قيم التطبيق",
                    icon: Iconsax.star,
                    onTap: () {
                      CustomBottomSheet.show(
                          context, const RatingWidget(), 0.5);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "شارك التطبيق",
                    icon: Ionicons.share_social_outline,
                    onTap: () {}),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "تغيير كلمة المرور",
                    icon: Iconsax.lock,
                    onTap: () {
                      CustomBottomSheet.show(
                          context, const ChangePasswordScreen(), 0.7);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "الشروط والاحكام",
                    icon: Ionicons.document_text_outline,
                    onTap: () {
                      Get.toNamed(AppRoute.termsConditionsPage);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    title: "سياسة الخصوصية",
                    icon: Ionicons.document_text_outline,
                    onTap: () {
                      Get.toNamed(AppRoute.privacyPolicyPage);
                    }),
                SizedBox(
                  height: 20.h,
                ),
                CustomDrawerItemsWdget(
                    iconColor: AppColors.lightColor3,
                    textColor: AppColors.lightColor3,
                    title: "تسجيل الخروج",
                    icon: Ionicons.log_out_outline,
                    onTap: () {
                      logOutDialogWidget(context);
                    }),
                SizedBox(
                  height: 30.h,
                ),
              ]),
            )
          ])),
    );
  }
}
