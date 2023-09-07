import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_shadow.dart';
import 'package:flutter_shop_app_dbestech/pages/application/notifier/application_nav_notifier.dart';
import 'package:flutter_shop_app_dbestech/pages/application/view/widgets/widgets.dart';

class Application extends ConsumerWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: 355.w,
            height: 56.h,
            decoration: appBoxShadowWithRadius(
                backgroundColor: AppColors.primaryElement),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                ref
                    .read(applicationNavIndexProvider.notifier)
                    .changeIndex(value);
              },
              elevation: 0,
              items: bottomTabs,
              // type: BottomNavigationBarType.fixed,
              // showSelectedLabels: false,
              // showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}
