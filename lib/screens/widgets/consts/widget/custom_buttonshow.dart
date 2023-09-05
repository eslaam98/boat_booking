import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static void show(BuildContext context, Widget child, double height) {
    Get.bottomSheet(
      Container(
          height: MediaQuery.of(context).size.height * height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: child),
      backgroundColor: Colors.transparent,
      ignoreSafeArea: true,
      isScrollControlled: true,
    );
  }
}
