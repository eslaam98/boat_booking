import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextdetailsWidget extends StatelessWidget {
  final String title;
  const CustomTextdetailsWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.customappColors)),
        SizedBox(
          width: 10.w,
        ),
        Flexible(
          child: CustomTextCuption(
              textAlign: TextAlign.start,
              color: Colors.grey,
              fontSize: 15,
              title: title),
        ),
      ],
    );
  }
}
