import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/image_res.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_text_field.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/popup_message.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search txt box
      Container(
        height: 45.h,
        width: 270.w,
        decoration: appBoxShadow(
            backgroundColor: AppColors.primaryBackgroud,
            boxBorder: Border.all(color: AppColors.primaryFourthElementText),
            borderRadius: 15),
        child: Row(
          children: [
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: appTextField(
                enableborder: true,
                icon: Icons.search,
                hintText: "Search your course...",
                func: (value) {},
              ),
            )
          ],
        ),
      ),
      //search button
      GestureDetector(
        onTap: () {
          toast2(msg: "test", color: Colors.red);
        },
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: 40.w,
          height: 40.h,
          decoration: appBoxShadow(
            borderRadius: 15,
            backgroundColor: AppColors.primaryElement,
            boxBorder: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset(IconsRes.option),
        ),
      )
    ],
  );
}
