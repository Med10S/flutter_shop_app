import 'package:flutter_shop_app_dbestech/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
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
}
