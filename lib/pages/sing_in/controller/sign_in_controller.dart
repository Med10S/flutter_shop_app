import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/models/user.dart';
import 'package:flutter_shop_app_dbestech/common/utils/constants.dart';
import 'package:flutter_shop_app_dbestech/common/utils/global_loader/global_loader.dart';
import 'package:flutter_shop_app_dbestech/global.dart';
import 'package:flutter_shop_app_dbestech/pages/sing_in/provider/sign_in_notifier.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../common/utils/Routes/router.dart';
import '../../../common/widgets/popup_message.dart';
import '../../register/exceptions/sing_up_exeption_failure.dart';
import '../repo/sign_in_repo.dart';

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
      toast2(
        msg: "Your password is empty",
        color: Colors.red,
      );
      //  showToastError(fToast: fToast, msg: "Your password is empty");
      return;
    }
    if (email.isEmpty) {
      toast2(color: Colors.red, msg: "Your email is empty");
      return;
    }
    //pour loader la page dans le code presedent j'avais un loader lors du click sur le bitton login
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await SignInRepo.forebaseSignIn(email, password);

      if (credential.user == null) {
        toast2(color: Colors.red, msg: "User not found");
      }
      if (!credential.user!.emailVerified) {
        toast2(
            color: Colors.white,
            msg: "Your must verify your email address first !");
      }
      var user = credential.user;
      // print("123123 $user");
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;
        LogingRequestModel logingRequesEntity = LogingRequestModel();

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
        toast2(color: Colors.red, msg: "login error");
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      toast2(color: Colors.red, msg: ex.message);
    } catch (e) {
      debugPrint(e.toString());
    }
//pour enlever le loader de la page dans le code presedent j'avais un loader lors du click sur le bitton login

    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }

  Future<void> asyncPostAllData(LogingRequestModel logingRequestModel) async {
    //we need to talk to server
    var result = await SignInRepo.login(queryParameters: logingRequestModel);
    // print("result.code is${result.code}");
    if (result.code == 200) {
      try {
        var navigator = Navigator.of(ref.context);
        //try to remeber user data
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        navigator.pushNamedAndRemoveUntil(
            AppRoutes.application, (route) => false);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      toast2(
          color: Colors.red,
          // icon: const Icon(Icons.warning),
          msg: "login error");
    }
    //have local storage

    //redirect to new page
  }
}
