import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class CustomNaviBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final dynamic Function(int) onTap;
  const CustomNaviBar(
      {Key? key,
      required this.items,
      required this.onTap,
      required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      elevation: 10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      backgroundColor: AppColors.lightColor,
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: items,
    );
  }
}
