import 'package:boat_booking/screens/widgets/animation/slide_fade_transition.dart';
import 'package:flutter/material.dart';

class CustomAnimation extends StatelessWidget {
  final Widget widget;
  final int millisecond;
  // final Curve? curve;
  const CustomAnimation({
    Key? key,
    required this.widget,
    required this.millisecond,
    //this.curve
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideFadeTransition(
        curve: Curves.easeInOutBack,
        delayStart: const Duration(milliseconds: 50),
        animationDuration: Duration(milliseconds: millisecond),
        offset: 2.5,
        child: widget);
  }
}
