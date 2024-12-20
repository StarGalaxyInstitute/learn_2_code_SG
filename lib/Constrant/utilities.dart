// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static Color blackcolor = Color(0xff000000);
  static Color whitecolor = Color(0xffffffff);
  static Color greycolor = Color.fromARGB(255, 116, 114, 114);
  static Color darkBlue = Color(0xff0F3460);
  static Color softBlue = Color(0xff0F80CC);
  static Color btnBlue = Color(0xff2584F4);
}

class PrefernceKey {
  static String isUserVerify = "isUserVerify";
  static String isIntroductionScreenLoaded = "isIntroductionScreenLoaded";
  static String isStudentFlow = "isStudentFlow";
  static String isStaffFlow = "isStaffFlow";
  static String isParentsFlow = "isParentsFlow";
}

class AppImage {
  static String images = "assets/images/";
  static String icons = "assets/icons/";
}