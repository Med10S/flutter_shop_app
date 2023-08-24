import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/dimention.dart';
import 'package:flutter_shop_app_dbestech/common/utils/global_loader/global_loader.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/text_widget.dart';
import 'package:flutter_shop_app_dbestech/pages/register/widgets/sign_up_form_widget.dart';

import '../../common/widgets/app_bar_widget.dart';

class SingUp extends ConsumerWidget {
  const SingUp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar(title: "Sign Up", context: context),
              body: loader == false
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimenssion.height20dp * 2,
                          ),
                          Center(
                            child: textNormal(
                                text: "Enter your details & free sign up ",
                                texteSize: 14,
                                textColors: AppColors.primaryThreeElementText),
                          ),
                          SizedBox(
                            height: Dimenssion.height20dp * 2,
                          ),
                          const SignUpForm(),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        color: AppColors.primaryElement,
                      ),
                    ))),
    );
  }
}
