import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/global_loader/global_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../common/widgets/popup_message.dart';
import '../exceptions/sing_up_exeption_failure.dart';
import '../provider/register_notifier.dart';
import '../repo/sign_up_repo.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp({required FToast fToast}) async {
    var state = ref.read(registerStateNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    // debugPrint("Your name is $name");
    // debugPrint("Your email is $email");
    // debugPrint("Your password is $password");
    // debugPrint("Your rePassword is $rePassword");

//--------------- input verification-------------------

    if (name.isEmpty) {
      showToastError(fToast: fToast, msg: "Your name is empty");
      return;
    }
    if (password.isEmpty) {
      showToastError(fToast: fToast, msg: "Your password is empty");
      return;
    }
    if (password != rePassword || password.isEmpty || rePassword.isEmpty) {
      showToastError(fToast: fToast, msg: "Your password did not match");
      return;
    }
// ----------------------------------------------------------
    var context = Navigator.of(ref.context);
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignUpRepo.forebaseSignUp(email, password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        showToastMessage(
            fToast: fToast,
            msg: '''An email has been send to verify your acount.
              Please open that email and confirm your identity''');
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      showToastError(fToast: fToast, msg: ex.message);
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        showToastError(fToast: fToast, msg: ex.message);
      }
    }
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
