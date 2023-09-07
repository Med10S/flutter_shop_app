import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_shadow.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/text_widget.dart';

import '../utils/colors.dart';

Widget appButton(
    {String buttonName = "",
    required double width,
    required double height,
    required Function onTapEvent,
    bool isLogin = true}) {
  return GestureDetector(
    onTap: () {
      onTapEvent();
    },
    child: Container(
      height: height,
      width: width,
      decoration: appBoxShadow(
          backgroundColor: isLogin ? AppColors.primaryElement : Colors.white,
          borderRadius: 14),
      child: Center(
        child: TextNormal(
            text: buttonName,
            texteSize: 16,
            textColors:
                isLogin ? AppColors.primaryBackgroud : AppColors.primaryText),
      ),
    ),
  );
}
