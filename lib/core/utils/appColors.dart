// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {

  static Color mainColor = Color(0xFF5CB5EE);
  static Color secondaryColor = Color(0xFFE17100);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color textColor = Color(0xFF2E2E2E);



  static LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF3C353B),
      Color(0xFF785E57),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


}