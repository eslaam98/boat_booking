import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:flutter/material.dart';

class CustomTitleBold extends StatelessWidget {
  final String title;
  final Color color;
  final TextAlign? textAlign;
  const CustomTitleBold({
    Key? key,
    required this.title,
    required this.color,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Text(title,
          textAlign: textAlign,
          style: TextStyle(
              fontFamily: AppFontStyle.fontStyle,
              fontSize: 30,
              color: color,
              fontWeight: FontWeight.bold)),
    );
  }
}
