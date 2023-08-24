import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.primaryText)));

  static ThemeData appThemeDataDark = ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white, // Text color for dark mode
        ),
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)));
}
