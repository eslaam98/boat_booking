import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class CustomRatingStar extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  const CustomRatingStar(
      {super.key,
      this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color});

  Widget buildStar(BuildContext context, int index) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: isDarkModeEnabled ? AppColors.greyColor : AppColors.darkColor,
        size: 15,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: 14,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: 16,
      );
    }
    return InkResponse(
      onTap: () {},
      //  onRatingChanged == null ? null : () => onRatingChanged(index + 1.0);},
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}
