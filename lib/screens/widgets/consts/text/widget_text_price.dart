import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class WidgetTextPrice extends StatelessWidget {
  final String titlePrice;
  final double fontSize;
  const WidgetTextPrice(
      {Key? key, required this.titlePrice, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titlePrice,
      style: TextStyle(
          color: AppColors.blueStyleColor2,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4),
    );
  }
}
