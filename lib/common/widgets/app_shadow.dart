import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';

BoxDecoration appBoxShadow(
    {Color backgroundColor = AppColors.primaryFourthElementText,
    double borderRadius = 20,
    BoxBorder? boxBorder,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius(
    {Color backgroundColor = AppColors.primaryFourthElementText,
    double sR = 1,
    BoxBorder? boxBorder,
    double bR = 2}) {
  return BoxDecoration(
      color: backgroundColor,
      border: boxBorder,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxDecorationTextField({
  required Color backgroundColor,
  required double borderRadius,
  Color borderColor = AppColors.primaryFourthElementText,
}) {
  return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: borderColor));
}
