import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/services/http_utlis.dart';
import 'package:flutter_shop_app_dbestech/common/utils/app_styles.dart';
import 'package:flutter_shop_app_dbestech/global.dart';

import 'common/utils/Routes/routes.dart';

Future<void> main() async {
  await Global.init();
  HttpUtil();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context)
              .size
              .height), // Taille de conception de votre mise en page (largeur x hauteur)
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppPages.onGenerate,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.appThemeDataDark,
      theme: AppTheme.appThemeData,
    );
  }
}
