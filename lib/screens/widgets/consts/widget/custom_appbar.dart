import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget {
  final Widget title;
  final Widget widgetBar;
  final Color? color;
  const CustomAppBar(
      {Key? key, required this.title, required this.widgetBar, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 45.h,
          width: 45.w,
          child: TextButton(
            style: TextButton.styleFrom(
              side: BorderSide(color: color ?? AppColors.lightColor3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              // primary: kPrimaryColor,

              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              Navigator.maybePop(context);
            },
            child: Icon(
              Iconsax.arrow_right_3,
              size: 20,
              color: color ?? AppColors.darkColor,
            ),
          ),
        ),
        const Spacer(),
        title,
        const Spacer(),
      ],
    );
  }
}
