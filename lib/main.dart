import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/app_styles.dart';
import 'package:flutter_shop_app_dbestech/global.dart';

import 'common/utils/dimention.dart';
import 'common/utils/routes_router/routes.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dimenssion.init(context);
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
