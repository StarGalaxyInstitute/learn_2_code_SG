// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:get/get.dart';

class StudentProfilecontroller extends GetxController {
  RxBool isLoader = false.obs;

  @override
  void onInit() {
    Timer(
      Duration(seconds: 2),
      () {
        isLoader.value = true;
      },
    );
    super.onInit();
  }
}
