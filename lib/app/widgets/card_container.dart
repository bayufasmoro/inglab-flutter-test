import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inglab_flutter_test/res/app_colors.dart';


class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.radius = 10,
    this.shadowColor = AppColors.shadowGray,
    this.bgColor = Colors.white
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final Color shadowColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(width: 1, color: Colors.white),
          boxShadow: [BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: shadowColor,
          )],
        ),
        child: child,
    );
  }
}
