import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/Routes/router.dart';
import 'package:flutter_shop_app_dbestech/global.dart';
import 'package:flutter_shop_app_dbestech/pages/home/view/home.dart';

import '../../../pages/application/view/application.dart';
import '../../../pages/register/view/sign_up.dart';
import '../../../pages/sing_in/view/sing_in.dart';
import '../../../pages/welcome/view/welcome.dart';

class AppPages {
  static MaterialPageRoute onGenerate(RouteSettings settings) {
    bool isloggedIn = Global.storageService.isloggedIn();
    bool isTheFirstTime = Global.storageService.getDivisefirstOpen();
    if (settings.name == AppRoutes.welcome && isTheFirstTime) {
      if (isloggedIn) {
        return MaterialPageRoute(
            builder: (_) => const Application(), settings: settings);
      } else {
        return MaterialPageRoute(
            builder: (_) => const SingIn(), settings: settings);
      }
    }
    switch (settings.name) {
      case AppRoutes.singIn:
        return MaterialPageRoute(
            builder: (_) => const SingIn(), settings: settings);
      case AppRoutes.singUp:
        return MaterialPageRoute(
            builder: (_) => const SingUp(), settings: settings);
      case AppRoutes.application:
        return MaterialPageRoute(
            builder: (_) => const Application(), settings: settings);
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => const Home(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
    }
  }
}
