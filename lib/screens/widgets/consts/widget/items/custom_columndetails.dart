import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';

class CustomColumnDetails extends StatelessWidget {
  final String itemHeight;
  final String itemweight;
  final String itemFlash;

  const CustomColumnDetails(
      {super.key,
      required this.itemHeight,
      required this.itemweight,
      required this.itemFlash});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Ionicons.arrow_forward_circle_sharp,
            size: 30,
            color: AppColors.customappColors,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextCuption(title: "$itemHeight م"),
              const CustomTextCuption(
                  fontSize: 12, color: Colors.grey, title: "الطول"),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          SvgPicture.asset(
            AppImageAsset.kgIcon,
            height: 35,
            color: AppColors.customappColors,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextCuption(title: "$itemweight ك.غ"),
              const CustomTextCuption(
                  fontSize: 12, color: Colors.grey, title: "العرض"),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          ///////
          SvgPicture.asset(
            AppImageAsset.fullScreenIcon,
            height: 30,
            color: AppColors.customappColors,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextCuption(title: "$itemFlash م"),
              const CustomTextCuption(
                  fontSize: 12, color: Colors.grey, title: "الاشعاع"),
            ],
          ),
        ],
      ),
    );
  }
}
