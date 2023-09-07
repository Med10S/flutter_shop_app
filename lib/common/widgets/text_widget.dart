import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';

class TextNormal extends StatelessWidget {
  final String text;
  final double texteSize;
  final FontWeight fontWeight;
  final bool useTextColor;
  final TextAlign textAlign;
  final Color textColors;
  const TextNormal({
    super.key,
    required this.text,
    required this.texteSize,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.textColors = AppColors.primaryBG,
    this.useTextColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return textNormal(
      text: text,
      texteSize: texteSize,
      fontWeight: fontWeight,
      useTextColor: useTextColor,
      textColors: textColors,
      textAlign: textAlign,
    );
  }
}

Widget textNormal(
    {required String text,
    required FontWeight fontWeight,
    required bool useTextColor,
    required TextAlign textAlign,
    required double texteSize,
    required Color textColors}) {
  return Text(
    text,
    textAlign: textAlign,
    style: useTextColor
        ? TextStyle(
            color: textColors, fontSize: texteSize, fontWeight: fontWeight)
        : TextStyle(fontSize: texteSize, fontWeight: fontWeight),
  );
}
