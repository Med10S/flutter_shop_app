import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/dimention.dart';
import 'package:flutter_shop_app_dbestech/pages/welcome/view/widgets/widgets.dart';

import '../notifier/welcome_notifier.dart';

// ignore: must_be_immutable
class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print(Dimenssion.screenWidth);
    }
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
                      imagePath: "assets/images/bureau.jpg",
                      title: "First see Learnig",
                      subTitle:
                          "Forget about of paper all knowledge in one learnig",
                      index: 1),
                  appOnboardingPage(_controller, context,
                      imagePath: "assets/images/chaise_femme.jpg",
                      title: "Connect with Everyone",
                      subTitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      index: 2),
                  appOnboardingPage(_controller, context,
                      imagePath: "assets/images/pen_wemen.jpg",
                      title: "Always Fascinated Learnig",
                      subTitle:
                          "Anywhere, anytime. The time is at your discretion. So study wherever you can",
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
