import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/dimention.dart';
import 'package:flutter_shop_app_dbestech/common/utils/routes_router/router.dart';
import 'package:flutter_shop_app_dbestech/pages/sing_in/notifier/sign_in_notifier.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../common/utils/global_loader/global_loader.dart';
import '../../../common/widgets/app_text_field.dart';
import '../../../common/widgets/button_widget.dart';
import '../controller/sign_in_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    final SignInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return !loader
        ? Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimenssion.height5dp * 2,
                horizontal: kIsWeb
                    ? Dimenssion.width2dp * 50
                    : Dimenssion.width2dp * 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appTextField(
                    controller: _controller.emailController,
                    labelText: "Email",
                    hintText: "Enter your Email",
                    icon: Icons.email,
                    func: (value) => ref
                        .read(signInNotifierProvider.notifier)
                        .onUserEmailChange(value)),
                SizedBox(height: Dimenssion.height2dp * 15),
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
                  height: Dimenssion.height20dp * 5,
                ),
                Center(
                    child: appButton(
                        width: Dimenssion.width5dp * 71,
                        height: Dimenssion.height5dp * 10,
                        buttonName: "Login",
                        isLogin: true,
                        onTapEvent: () {
                          _controller.handelSignIn(fToast: fToast);
                        })),
                SizedBox(
                  height: Dimenssion.height20dp,
                ),
                Center(
                    child: appButton(
                        width: Dimenssion.width5dp * 71,
                        height: Dimenssion.height5dp * 10,
                        buttonName: "Register",
                        isLogin: false,
                        onTapEvent: () {
                          Navigator.pushNamed(context, AppRoutes.singUp);
                        })),
                SizedBox(
                  height: Dimenssion.height20dp,
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
