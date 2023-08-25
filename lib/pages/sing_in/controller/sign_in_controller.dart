import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/entities/user.dart';
import 'package:flutter_shop_app_dbestech/common/utils/constants.dart';
import 'package:flutter_shop_app_dbestech/common/utils/global_loader/global_loader.dart';
import 'package:flutter_shop_app_dbestech/global.dart';
import 'package:flutter_shop_app_dbestech/pages/sing_in/notifier/sign_in_notifier.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/utils/routes_router/router.dart';
import '../../../common/widgets/popup_message.dart';
import '../../register/exeptions/sing_up_exeption_failure.dart';

class SignInController {
  WidgetRef ref;
  SignInController(this.ref);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> handelSignIn({required FToast fToast}) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
    emailController.text = state.email;
    passwordController.text = state.password;
    debugPrint("Your email is $email");
    debugPrint("Your password is $password");

    if (password.isEmpty) {
      showToastError(fToast: fToast, msg: "Your password is empty");
      return;
    }
    if (email.isEmpty) {
      showToastError(fToast: fToast, msg: "Your email is empty");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user == null) {
        showToastError(fToast: fToast, msg: "User not found");
      }
      if (!credential.user!.emailVerified) {
        showToastError(
            fToast: fToast, msg: "Your must verify your email address first !");
      }

      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;
        LogingRequesEntity logingRequesEntity = LogingRequesEntity();

        logingRequesEntity.avatar = photoUrl;
        logingRequesEntity.name = displayName;
        logingRequesEntity.email = email;
        logingRequesEntity.openId = id;
        logingRequesEntity.type = 1;
        asyncPostAllData(logingRequesEntity);
        if (kDebugMode) {
          print("user logged in ");
        }
      } else {
        showToastError(fToast: fToast, msg: "login error");
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      showToastError(fToast: fToast, msg: ex.message);
    } catch (e) {}
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LogingRequesEntity logingRequesEntity) {
    //we need to talk to server

    //have local storage
    try {
      var navigator = Navigator.of(ref.context);
      //try ti remeber user data
      Global.storageService
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, "value");
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "value");
      navigator.pushNamedAndRemoveUntil(
          AppRoutes.application, (route) => false);
      //navigator.pushNamed("/Application");
    } catch (e) {}
    //redirect to new page
  }
}
