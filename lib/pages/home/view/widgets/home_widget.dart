// ignore_for_file: prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/utils/image_res.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_shadow.dart';
import 'package:flutter_shop_app_dbestech/pages/home/controller/home_controller.dart';
import '../../../../common/utils/colors.dart';
import '../../../../common/widgets/text_widget.dart';
import '../../../../global.dart';

//transforme widgets to class to use const
class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return userName();
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return helloText();
  }
}

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return banner(ref, controller);
  }
}

Widget helloText() {
  return TextNormal(
      text: "Hello,",
      texteSize: 24,
      fontWeight: FontWeight.bold,
      textColors: AppColors.primaryThreeElementText);
}

Widget userName() {
  return TextNormal(
    text: Global.storageService.getUserProfile().name.toString(),
    texteSize: 24,
    fontWeight: FontWeight.bold,
  );
}

Widget banner(WidgetRef ref, PageController controller) {
  return Column(
    children: [
      SizedBox(
        height: 160.h,
        child: PageView(
          controller: controller,
          onPageChanged: (value) {
            ref.read(homeSreenBannerDotsProvider.notifier).setIndex(value);
          },
          children: [
            bannerContainer(),
            bannerContainer(imagePath: ImageRes.chaisefemme),
            bannerContainer(imagePath: ImageRes.penwemen)
          ],
        ),
      ),
      SizedBox(
        height: 5.h,
      ),
      DotsIndicator(
        position: ref.watch(homeSreenBannerDotsProvider),
        dotsCount: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(24.0, 8.0),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      )
    ],
  );
}

Widget bannerContainer({String imagePath = ImageRes.bureau}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath))),
  );
}

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          IconsRes.menu,
          width: 20.w,
          height: 30.h,
        ),
        GestureDetector(
          child: Icon(
            Icons.person,
            size: 40,
          ),
        )
      ]),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextNormal(
                textColors: AppColors.primaryText,
                text: "Choise your course",
                texteSize: 20,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                  onTap: () {},
                  child: const TextNormal(text: "See All", texteSize: 14))
            ],
          ),
        ),
        //course item button
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              Container(
                decoration: appBoxShadow(
                    backgroundColor: AppColors.primaryElement,
                    borderRadius: 7.w),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: TextNormal(
                  text: 'All',
                  texteSize: 16,
                  textColors: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: TextNormal(
                    text: 'Popular',
                    texteSize: 16,
                    textColors: AppColors.primaryThreeElementText),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: TextNormal(
                    text: 'Newest',
                    texteSize: 16,
                    textColors: AppColors.primaryThreeElementText),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CourseItemGride extends StatelessWidget {
  const CourseItemGride({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 40),
        itemCount: 6,
        itemBuilder: (_, int index) {
          return Image.asset(ImageRes.chaisefemme);
        });
  }
}
