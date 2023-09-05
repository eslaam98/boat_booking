import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/domain/controller/navigatorbar/customnbar_controller.dart';
import 'package:boat_booking/screens/widgets/animation/custom_animation.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_card.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_navibar_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/exit_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class VisitorPage extends StatelessWidget {
  final void Function() onPressed;
  const VisitorPage({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CustomNBarControllerImp());
    return GetBuilder<CustomNBarControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Iconsax.location5,
                      size: 25,
                      color: AppColors.customappColors,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const CustomTextCuption(
                      fontSize: 15,
                      title: "الرياض - شارع المدينة",
                      color: AppColors.kPrimaryColor,
                    ),
                  ],
                ),
                actions: [
                  CustomCard(
                      widget: Row(children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomTextStyle(
                      title: "0.0",
                      fontSize: 15,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                      onPressed: () {
                        //    Get.toNamed(AppRoute.walletPage);
                      },
                      icon: const Icon(
                        Ionicons.wallet_outline,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ]))
                ],
                leading: CustomCard(
                  widget: IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(
                      AppImageAsset.menuicon,
                      color: AppColors.darkColor,
                      height: 27,
                    ),
                  ),
                ),
              ),
              body: WillPopScope(
                onWillPop: alertExitApp,
                child: CustomAnimation(
                    millisecond: 1500,
                    widget:
                        controller.listPage.elementAt(controller.currentPage)),
                //  ),
              ),
              bottomNavigationBar: CustomNaviBar(
                  items: controller.items,
                  currentIndex: controller.currentPage,
                  onTap: (index) {
                    controller.changePage(index);
                  }),
            ));
  }
}
