import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/Routes/router.dart';
import 'package:flutter_shop_app_dbestech/pages/sing_in/provider/sign_in_notifier.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../common/utils/global_loader/global_loader.dart';
import '../../../../common/widgets/app_text_field.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../controller/sign_in_controller.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  late SignInController _controller;
  late FToast fToast;

  @override
  void initState() {
    _controller = SignInController(ref);
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loader = ref.watch(appLoaderProvider);

    return !loader
        ? Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                vertical: 10.h, horizontal: kIsWeb ? 100.w : 14.w),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appTextField(
                    controller: _controller.emailController,
                    labelText: "Email",
                    hintText: "Enter your Email",
                    icon: Icons.email,
                    func: (value) => ref
                        .read(signInNotifierProvider.notifier)
                        .onUserEmailChange(value)),
                SizedBox(height: 30.h),
                appTextField(
                    controller: _controller.passwordController,
                    obscureText: true,
                    labelText: "Password",
                    hintText: "Enter your Password",
                    icon: Icons.fingerprint,
                    func: (value) => ref
                        .read(signInNotifierProvider.notifier)
                        .onUserPasswordChange(value)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: AppColors.primaryBG,
                            decoration: TextDecoration.underline),
                      )),
                ),
                SizedBox(
                  height: kIsWeb ? 40.h : 100.h,
                ),
                Center(
                    child: appButton(
                        width: 355.w,
                        height: 50.h,
                        buttonName: "Login",
                        isLogin: true,
                        onTapEvent: () {
                          _controller.handelSignIn(fToast: fToast);
                        })),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: appButton(
                        width: 355.w,
                        height: 50.h,
                        buttonName: "Register",
                        isLogin: false,
                        onTapEvent: () {
                          Navigator.pushNamed(context, AppRoutes.singUp);
                        })),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )
        : showLoader();
  }
}

Widget showLoader() {
  return const AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 16.0),
        Text(
            'Chargement en cours...'), // Texte indiquant que le chargement est en cours
      ],
    ),
  );
}
