import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_card.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';

class CustomCardDetails extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData icon;
  final String subtitle;
  const CustomCardDetails(
      {Key? key,
      required this.title,
      required this.icon,
      required this.subtitle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    return CustomCard(
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: onTap,
          leading: Icon(icon,
              size: 30,
              color: isDarkModeEnabled
                  ? AppColors.kSecondaryTextColor
                  : AppColors.kSecondaryColor),
          title: CustomTextStyle(title: title, fontSize: 15),
          subtitle: CustomTextCuption(title: subtitle, fontSize: 12),
        ),
      ),
    );
  }
}
