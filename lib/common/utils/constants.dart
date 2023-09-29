// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

class AppConstants {
  //static const String SERVER_API_URL = "ip address";
  static const String STORAGE_USER_PROFILE_KEY = "user_profile";
  static const String STORAGE_USER_TOKEN_KEY = "USER_TOKEN";
  static const String STORAGE_DIVICE_OPEN_FIRST_KEY = "fisrt_time";
  static const String BASE_URL_For_ALL = "http://192.168.8.100:8000/";
  static const String BASE_URL_For_NETWORK_IMAGE =
      '${BASE_URL_For_ALL}uploads/';
}

bool isCupertino() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return true;
  }
}
