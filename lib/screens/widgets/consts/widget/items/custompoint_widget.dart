import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPointWidget extends StatelessWidget {
  const CustomPointWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.customappColors));
  }
}
