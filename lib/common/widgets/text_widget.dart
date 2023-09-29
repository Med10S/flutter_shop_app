import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';

class TextNormal extends StatelessWidget {
  final String text;
  final double texteSize;
  final FontWeight fontWeight;
  final bool useTextColor;
  final TextAlign textAlign;
  final Color textColors;
  final bool softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  const TextNormal(
      {super.key,
      required this.text,
      required this.texteSize,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.center,
      this.textColors = AppColors.primaryBG,
      this.useTextColor = true,
      this.softWrap = false,
      this.maxLines,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return textNormal(
      maxLines: maxLines,
      softWrap: softWrap,
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
    required bool softWrap,
    int? maxLines,
    TextOverflow? overflow,
    required Color textColors}) {
  return Text(
    text,
    maxLines: maxLines,
    softWrap: softWrap,
    overflow: overflow,
    textAlign: textAlign,
    style: useTextColor
        ? TextStyle(
            color: textColors, fontSize: texteSize, fontWeight: fontWeight)
        : TextStyle(fontSize: texteSize, fontWeight: fontWeight),
  );
}
