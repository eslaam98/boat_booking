import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/pages/home/home_page.dart';
import 'package:boat_booking/screens/widgets/consts/widget/drawer/menu_screen.dart';
import 'package:boat_booking/screens/pages/visitor/visitor_page.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

final zoomDrawerController = ZoomDrawerController();

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ZoomDrawer(
      isRtl: true,
      menuBackgroundColor: AppColors.customappColors,
      controller: zoomDrawerController,
      mainScreenScale: 0.2,
      angle: -7.0,
      drawerShadowsBackgroundColor: Colors.grey[300]!,
      slideWidth: MediaQuery.of(context).size.width * .44,
      openCurve: Curves.fastOutSlowIn,
      menuScreenWidth: Get.width,
      closeCurve: Curves.bounceIn,
      //showShadow: true,
      style: DrawerStyle.style2,
      menuScreen: Builder(builder: (context) {
        return const MenuScreen();
      }),
      mainScreen: sharedService.sharedPref.getString('user_id') == null
          ? VisitorPage(
              onPressed: () {
                zoomDrawerController.toggle?.call();
              },
            )
          : HomePage(
              onPressed: () {
                zoomDrawerController.toggle?.call();
              },
            ),
    ));
  }
}
