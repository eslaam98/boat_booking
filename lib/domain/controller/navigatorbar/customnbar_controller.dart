import 'package:boat_booking/screens/pages/booking/booking_page.dart';
import 'package:boat_booking/screens/pages/home/home_screen.dart';
import 'package:boat_booking/screens/pages/notifications/notifications_page.dart';
import 'package:boat_booking/screens/pages/safari/safari_page.dart';
import 'package:boat_booking/screens/pages/search/search_page.dart';
import 'package:boat_booking/screens/widgets/consts/widget/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

abstract class CustomNBarController extends GetxController {
  changePage(int currentPage);
}

class CustomNBarControllerImp extends CustomNBarController {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomeScreen(),
    const SearchPage(),
    const SafariPage(),
    const NotificationsPage(),
    const BookingPage()
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
      Ionicons.home_outline,
    )),
    const BottomNavigationBarItem(
      icon: Icon(Ionicons.search_outline),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Ionicons.bag_outline),
    ),
    const BottomNavigationBarItem(
      icon: AppBadge(child: Icon(Ionicons.notifications_outline)),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.document_normal),
    ),
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int i) {
    currentPage = i;
    update();
  }
}
