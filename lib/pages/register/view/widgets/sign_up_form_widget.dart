import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/widgets/app_text_field.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../common/widgets/text_widget.dart';
import '../../controller/sign_up_controller.dart';
import '../../provider/register_notifier.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  late SignUpController signInController;
  late FToast fToast;

  @override
  void initState() {
    signInController = SignUpController(ref: ref);
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerStateNotifierProvider);

    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //user name
            appTextField(
                labelText: "User Name",
                hintText: "Enter your Name",
                icon: Icons.person_outline_outlined,
                func: (value) => ref
                    .read(registerStateNotifierProvider.notifier)
                    .onUserNameChange(value)),

            SizedBox(height: 30.h),
            //email
            appTextField(
                labelText: "Email",
                hintText: "Enter your Email",
                icon: Icons.email,
                func: (value) => ref
                    .read(registerStateNotifierProvider.notifier)
                    .onUserEmailChange(value)),

            SizedBox(height: 30.h),
            //password
            appTextField(
                obscureText: true,
                labelText: "Password",
                hintText: "Enter your Password",
                icon: Icons.fingerprint,
                func: (value) => ref
                    .read(registerStateNotifierProvider.notifier)
                    .onUserPasswordChange(value)),

            SizedBox(height: 30.h),
            //confirm Password
            appTextField(
                obscureText: true,
                labelText: "Confirm Password",
                hintText: "Confirm your Password",
                icon: Icons.fingerprint,
                func: (value) => ref
                    .read(registerStateNotifierProvider.notifier)
                    .onUserRePasswordChange(value)),

            SizedBox(height: 20.h),
            const Align(
              alignment: Alignment.centerLeft,
              child: Align(
                child: TextNormal(
                    textAlign: TextAlign.start,
                    text:
                        "By creating an account you have to agree with our them & condition",
                    texteSize: 14,
                    textColors: AppColors.primaryThreeElementText),
              ),
            ),
            //register button
            SizedBox(
              height: 75.h,
            ),
            Center(
                child: appButton(
                    width: 355.w,
                    height: 50.h,
                    buttonName: "Register",
                    isLogin: true,
                    onTapEvent: () {
                      signInController.handleSignUp(fToast: fToast);
                    })),
          ],
        ),
      ),
    );
  }
}
