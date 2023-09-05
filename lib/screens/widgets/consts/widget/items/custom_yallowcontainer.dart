import 'package:boat_booking/screens/widgets/consts/text/custom_text_tow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class CustomYallowContainer extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final String? titlePeople;

  const CustomYallowContainer(
      {super.key, this.title, this.iconData, this.titlePeople});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 70.w,
      decoration: BoxDecoration(
          color: const Color(0xFFffb726),
          borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomTextTow(title: title ?? "4.5", fontSize: 15),
        SizedBox(
          height: 5.h,
        ),
        Icon(
          iconData ?? Ionicons.star,
          color: Colors.white,
        ),
        CustomTextTow(title: titlePeople ?? "", fontSize: 8),
      ]),
    );
  }
}
