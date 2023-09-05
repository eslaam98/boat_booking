import 'package:boat_booking/screens/widgets/consts/buttons/custom_textbotton.dart';
import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  final String textTitle;

  final void Function()? onPressed;
  const CustomTitleWidget({
    Key? key,
    required this.textTitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextBotton(
          mainAxisAlignment: MainAxisAlignment.start,
          color: Colors.black,
          title: textTitle,
        ),
      ],
    );
  }
}
