import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/constants.dart';
import 'package:flutter_shop_app_dbestech/common/utils/Routes/router.dart';
import 'package:flutter_shop_app_dbestech/global.dart';

import '../../../../common/widgets/app_shadow.dart';
import '../../../../common/widgets/text_widget.dart';

Widget appOnboardingPage(PageController controller, BuildContext context,
    {required String imagePath,
    required String title,
    required String subTitle,
    required int index}) {
  return kIsWeb
      ? Row(
          children: [
            Image.asset(imagePath),
            Center(
              child: Column(
                children: [
                  Container(
                      width: 200.w,
                      margin: EdgeInsets.only(top: 200.h),
                      child: TextNormal(
                        useTextColor: false,
                        text: title,
                        texteSize: 24,
                      )),
                  Container(
                    width: 250,
                    margin: EdgeInsets.only(top: 15.h),
                    //padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextNormal(
                        text: subTitle,
                        useTextColor: false,
                        texteSize: 16,
                        textColors: AppColors.primarySecondaryElementText),
                  ),
                ],
              ),
            ),
            _nextButton(index, controller, context)
          ],
        )
      : Column(
          children: [
            Image.asset(imagePath),
            Center(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      child: TextNormal(
                          text: title,
                          texteSize: 24,
                          textColors: AppColors.primaryText)),
                  Container(
                    margin: EdgeInsets.only(top: 15.h),
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: TextNormal(
                        text: subTitle,
                        texteSize: 16,
                        textColors: AppColors.primarySecondaryElementText),
                  ),
                ],
              ),
            ),
            _nextButton(index, controller, context)
          ],
        );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Navigator.pushNamed(context, AppRoutes.singIn);
        //remenber if we are fisrt time open the application
        Global.storageService
            .setBool(AppConstants.STORAGE_DIVICE_OPEN_FIRST_KEY, true);
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
      decoration: appBoxShadow(
          backgroundColor: AppColors.primaryElement, borderRadius: 15),
      child: Center(
          child: TextNormal(
        text: index < 3 ? "Next" : "Get Started",
        texteSize: 16,
        textColors: Colors.white,
      )),
    ),
  );
}
