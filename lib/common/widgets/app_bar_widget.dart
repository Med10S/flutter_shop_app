import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/text_widget.dart';

AppBar buildAppBar(
    {required String title,
    required BuildContext context,
    Widget? leading,
    Color textColor = Colors.black,
    bool bottomShadow = true,
    bool backButton = kIsWeb}) {
  return AppBar(
    leading: leading,
    automaticallyImplyLeading: backButton ? false : true,
    bottom: bottomShadow
        ? PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              color: Colors.grey.withOpacity(0.3),
            ),
          )
        : null,
    centerTitle: kIsWeb ? false : true,
    title: !kIsWeb
        ? TextNormal(text: title, texteSize: 16, textColors: textColor)
        : Align(
            alignment: Alignment.centerRight,
            child:
                TextNormal(text: title, texteSize: 16, textColors: textColor),
          ),
  );
}
