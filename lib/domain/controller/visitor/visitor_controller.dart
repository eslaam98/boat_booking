// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hotels_app/config/themes/app_colors.dart';
// import 'package:hotels_app/view/pages/auth/login/login_page.dart';
// import 'package:hotels_app/view/screens/user/home/user_hview.dart';

// abstract class VisitorController extends GetxController {
//   changePage(int currentPage);
// }

// class VisitorControllerImp extends VisitorController {
//   int currentPage = 0;

//   List<Widget> listPage = [const UserHView(), const LoginPage()];
//   List<BottomNavyBarItem> items = [
//     BottomNavyBarItem(
//         icon: Icon(Icons.home_outlined),
//         title: Text('32'.tr),
//         inactiveColor: AppColors.greyColor,
//         activeColor: AppColors.blueStyleColor2),
//     BottomNavyBarItem(
//       inactiveColor: AppColors.greyColor,
//       icon: Icon(Icons.login_outlined),
//       title: Text("تسجيل الدخول"),
//       activeColor: AppColors.blueStyleColor2,
//     ),
//   ];

//   @override
//   changePage(int i) {
//     currentPage = i;
//     update();
//   }
// }
