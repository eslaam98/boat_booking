import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';

class CustomTextBotton extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final MainAxisAlignment mainAxisAlignment;
  final void Function()? onPressed;
  const CustomTextBotton(
      {Key? key,
      required this.title,
      required this.color,
      this.onPressed,
      required this.mainAxisAlignment,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: mainAxisAlignment, children: [
      TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            // decoration: TextDecoration.underline,
            fontWeight: fontWeight,
            fontSize: 15,
            color: color,
            fontFamily: AppFontStyle.fontStyle,
          ),
        ),
      ),
    ]);
  }
}
