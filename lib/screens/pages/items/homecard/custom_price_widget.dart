import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';

class CustomPriceWidget extends StatelessWidget {
  final String price;
  const CustomPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(price,
          style: const TextStyle(
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w800,
              color: Colors.black)),
      const SizedBox(
        width: 5,
      ),
      const CustomTextCuption(
          color: AppColors.customappColors,
          fontFamily: 'Open Sans',
          fontSize: 10,
          title: "USD")
    ]);
  }
}
