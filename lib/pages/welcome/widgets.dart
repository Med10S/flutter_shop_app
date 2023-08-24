import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';

import '../../common/widgets/app_shadow.dart';
import '../../common/widgets/text_widget.dart';

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
                      width: 200,
                      margin: const EdgeInsets.only(top: 200),
                      child: textNormal(
                        textColor: false,
                        text: title,
                        texteSize: 24,
                      )),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(top: 15),
                    //padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: textNormal(
                        text: subTitle,
                        textColor: false,
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
                      margin: const EdgeInsets.only(top: 15),
                      child: textNormal(
                          text: title,
                          texteSize: 24,
                          textColors: AppColors.primaryText)),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: textNormal(
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
        Navigator.pushNamed(context, "/singIn");
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 80, left: 25, right: 25),
      decoration: appBoxShadow(
          backgroundColor: AppColors.primaryElement, borderRadius: 15),
      child: Center(
          child: textNormal(
        text: index < 3 ? "Next" : "Get Started",
        texteSize: 16,
        textColors: Colors.white,
      )),
    ),
  );
}
