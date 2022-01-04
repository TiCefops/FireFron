import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
Widget backgroundColor(double width, double height, Widget child) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: <Color>[
          AppColors.primary,
          AppColors.primaryDark,
        ],
      ),
    ),
    child: child,
  );
}
