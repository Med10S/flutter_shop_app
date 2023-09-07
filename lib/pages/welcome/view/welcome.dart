import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/image_res.dart';
import 'package:flutter_shop_app_dbestech/pages/welcome/view/widgets/widgets.dart';
import '../../../common/utils/app_string.dart';
import '../notifier/welcome_notifier.dart';

// ignore: must_be_immutable
class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              //showing our three welcome pages
              PageView(
                onPageChanged: (value) {
                  ref.read(indexDotProvider.notifier).changeIndex(value);
                },
                controller: _controller,
                children: [
//chaque appOnboardingPage est page et caque page a un boutton
                  appOnboardingPage(_controller, context,
                      imagePath: ImageRes.bureau,
                      title: AppString.fisrtWelcometitle,
                      subTitle: AppString.fisrtWelcomeSubtitle,
                      index: 1),
                  appOnboardingPage(_controller, context,
                      imagePath: ImageRes.chaisefemme,
                      title: AppString.secondeWelcometitle,
                      subTitle: AppString.secondeWelcomeSubtitle,
                      index: 2),
                  appOnboardingPage(_controller, context,
                      imagePath: ImageRes.penwemen,
                      title: AppString.therdWelcometitle,
                      subTitle: AppString.therdWelcomeSubtitle,
                      index: 3),
                ],
              ),

              //for showing dots
              Positioned(
                bottom: 80,
                child: DotsIndicator(
                  position: index,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
