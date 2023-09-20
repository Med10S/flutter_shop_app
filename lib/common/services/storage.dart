import 'dart:convert';

import 'package:flutter_shop_app_dbestech/common/models/user.dart';
import 'package:flutter_shop_app_dbestech/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  ///[setString] utiliser dans se context ce n'est pas
  ///le meme utliser dans
  ///[_preferences.setString]

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  UserProfile getUserProfile() {
    //whene i use getString with key he serch his value and return it
    //in our case he is returning the jsonEncode value from SignInController.asyncPostAllData
    //so I am using jsonDecode to decode the data and get it like a json file with key and value
    var profile =
        _preferences.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    // print("profile  :$profile");

    var profileJson = jsonDecode(profile);

    // print("profile json :$profileJson");

    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool getDivisefirstOpen() {
    return _preferences.getBool(AppConstants.STORAGE_DIVICE_OPEN_FIRST_KEY) ??
        false;
  }

  bool isloggedIn() {
    return _preferences.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  String getUserToken() {
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }
}
