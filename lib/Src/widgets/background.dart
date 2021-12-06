

import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';

Widget backgroundColor(wideth,height,child){
  return Container(
    width:wideth ,
      height:height ,
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
      AppColors.primary,
      AppColors.primaryDark,

      ],

  )
  ),
          child: child,
  );
}