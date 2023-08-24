import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/text_widget.dart';

import '../utils/colors.dart';

AppBar buildAppBar({required String title, required BuildContext context}) {
  return AppBar(
    automaticallyImplyLeading: kIsWeb ? false : true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        height: 1,
        color: Colors.grey.withOpacity(0.3),
      ),
    ),
    centerTitle: kIsWeb ? false : true,
    title: !kIsWeb
        ? textNormal(
            text: title,
            texteSize: 16,
            textColors: AppColors.primaryText,
          )
        : Align(
            alignment: Alignment.centerRight,
            child: textNormal(
                text: title, texteSize: 16, textColors: Colors.white),
          ),
  );
}
