import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/global_loader/global_loader.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_bar_widget.dart';
import 'package:flutter_shop_app_dbestech/pages/sing_in/widgets/sign_in_widget.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/text_widget.dart';
import 'widgets/sign_in_form_widget.dart';

class SingIn extends ConsumerWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              appBar:
                  buildAppBar(leading: null, title: "Login", context: context),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //top loging button
                    thirdPartyLoging(),
                    //more login option
                    Center(
                      child: textNormal(
                          text: "Or use your email account to loging ",
                          texteSize: 14,
                          textColors: AppColors.primaryThreeElementText),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const SignInForm(),
                  ],
                ),
              ))),
    );
  }
}
