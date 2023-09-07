import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/global_loader/global_loader.dart';
import 'package:flutter_shop_app_dbestech/common/utils/Routes/router.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/text_widget.dart';
import 'package:flutter_shop_app_dbestech/pages/register/view/widgets/sign_up_form_widget.dart';

import '../../../common/widgets/app_bar_widget.dart';

class SingUp extends ConsumerWidget {
  const SingUp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar(

                  ///a cause du passage de l'activiter register a sign in avec le back button integer
                  ///il fesait un pop se qui ne construit pas la page donc fToast n'est initialiser
                  ///donc j'ai modifier la logique de retour en utlisant Navigator.pushNamed(context, AppRoutes.singIn);

                  leading: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.singIn);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  title: "Sign Up",
                  context: context,
                  backButton: false),
              body: loader == false
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          const Center(
                            child: TextNormal(
                                text: "Enter your details & free sign up ",
                                texteSize: 14,
                                textColors: AppColors.primaryThreeElementText),
                          ),
                          SizedBox(
                            height: 40.h,
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
