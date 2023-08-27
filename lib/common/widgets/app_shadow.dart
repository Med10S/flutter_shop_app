import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';

BoxDecoration appBoxShadow(
    {required Color backgroundColor,
    required double borderRadius,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius(
    {required Color backgroundColor, double sR = 1, double bR = 2}) {
  return BoxDecoration(
      color: backgroundColor,
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
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: borderColor));
}
