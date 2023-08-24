import 'package:flutter/material.dart';

//height of my phone is 840
///width of my phone is 432

class Dimenssion {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

//640/
  // ignore: non_constant_identifier_names
  static double FirstPagesImageHeight = screenHeight / 1.9;
  static double height2dp = screenHeight / 420;

  static double height5dp = screenHeight / 168;
  static double height20dp = screenHeight / 42;
  static double height30dp = screenHeight / 28;

  static double width5dp = screenWidth / 86.4;
  static double width2dp = screenWidth / 216;
}
