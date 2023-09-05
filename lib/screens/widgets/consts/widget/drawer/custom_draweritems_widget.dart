import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerItemsWdget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? textColor;
  final Color? iconColor;

  final void Function() onTap;

  const CustomDrawerItemsWdget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.textColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(
          icon,
          color: iconColor ?? Colors.white,
        ),
        SizedBox(
          width: 20.w,
        ),
        CustomTextCuption(
          fontSize: 17,
          title: title,
          color: textColor ?? Colors.white,
        ),
      ]),
    );
  }
}
