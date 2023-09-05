import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class CustomYachetNameWid extends StatelessWidget {
  final String yachetName;
  final String yachetLocation;

  const CustomYachetNameWid({
    super.key,
    required this.yachetName,
    required this.yachetLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextCuption(fontSize: 20, title: yachetName),
          Row(
            children: [
              const Icon(
                Ionicons.location,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomTextCuption(
                  fontSize: 12,
                  color: AppColors.kPrimaryColor,
                  title: yachetLocation)
            ],
          ),
        ],
      )
    ]);
  }
}
