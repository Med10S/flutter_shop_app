import 'package:flutter/cupertino.dart';
import 'package:flutter_shop_app_dbestech/common/utils/routes_router/router.dart';

import '../../../pages/application/application.dart';
import '../../../pages/register/sign_up.dart';
import '../../../pages/sing_in/sing_in.dart';
import '../../../pages/welcome/welcome.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    //------------------pollution-----------------------
    case AppRoutes.singIn:
      return CupertinoPageRoute(builder: (_) => const SingIn());
    case AppRoutes.singUp:
      return CupertinoPageRoute(builder: (_) => const SingUp());
    case AppRoutes.application:
      return CupertinoPageRoute(builder: (_) => const Application());
    default:
      return CupertinoPageRoute(
        builder: (_) => Welcome(),
      );
  }
}
