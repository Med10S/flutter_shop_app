import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';

Widget textNormal(
    {required String text,
    bool textColor = true,
    TextAlign textAlign = TextAlign.center,
    required double texteSize,
    Color textColors = AppColors.primaryBG}) {
  return Text(
    text,
    textAlign: textAlign,
    style: textColor
        ? TextStyle(
            color: textColors,
            fontSize: texteSize,
            fontWeight: FontWeight.normal)
        : TextStyle(fontSize: texteSize, fontWeight: FontWeight.normal),
  );
}
