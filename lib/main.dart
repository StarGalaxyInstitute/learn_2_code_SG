// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: MediaQuery.of(context).platformBrightness,
      ),
      home: SplashPage(),
    );
  }
}
