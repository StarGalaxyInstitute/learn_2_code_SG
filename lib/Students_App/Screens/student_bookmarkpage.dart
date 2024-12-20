// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';

class StudentBookmarkpage extends StatelessWidget {
  const StudentBookmarkpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.02),
                  CommonWidgets().textWidget(
                    text: "Bookmark Courses",
                    textSize: 20.0,
                    textWeight: FontWeight.w600,
                  ),
                  SizedBox(height: Get.height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
