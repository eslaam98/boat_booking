import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Badge(
      largeSize: 35,
      alignment: Alignment.topRight,
      child: child,
    );
  }
}
