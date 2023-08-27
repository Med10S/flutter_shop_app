import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/dimention.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_shadow.dart';
import 'package:flutter_shop_app_dbestech/pages/application/notifier/application_nav_notifier.dart';
import 'package:flutter_shop_app_dbestech/pages/application/view/widgets/widgets.dart';

import '../../../common/widgets/app_bar_widget.dart';

class Application extends ConsumerWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(title: "Home page", context: context),
          body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: Dimenssion.width5dp * 75,
            height: Dimenssion.height2dp * 28,
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
