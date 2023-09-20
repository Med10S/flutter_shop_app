//API calls

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop_app_dbestech/common/models/user.dart';
import 'package:flutter_shop_app_dbestech/common/services/http_utlis.dart';

class SignInRepo {
  static Future<UserCredential> forebaseSignIn(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  static Future<UserLoginResponseEntity> login(
      {LogingRequestModel? queryParameters}) async {
    var responce = await HttpUtil()
        .post("api/login", queryParameters: queryParameters!.toJson());
    return UserLoginResponseEntity.fromJson(responce);
  }
}
