// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../Controllers/student_livesubject_tutoring_controller.dart';

class StudentRequestNewSubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whitecolor,
          appBar: AppBar(
            title: Text(
              "Request New Subject",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            backgroundColor: AppColors.whitecolor,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 6, left: 13, right: 10),
                  child: CommonWidgets().textWidget(
                      text: "Subject Name",
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  height: 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.btnborder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 3,
                      style: TextStyle(color: AppColors.blackcolor),
                      keyboardType: TextInputType.streetAddress,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintMaxLines: 1,
                        hintText: "Search a tutor....",
                        hintStyle: GoogleFonts.abyssinicaSil(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 6, left: 13, right: 10),
                  child: CommonWidgets().textWidget(
                      text: "Description",
                      textSize: 14.0,
                      textWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.btnborder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 3,
                      style: TextStyle(color: AppColors.blackcolor),
                      keyboardType: TextInputType.streetAddress,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintMaxLines: 1,
                        hintText: "Write a description about the subject....",
                        hintStyle: GoogleFonts.abyssinicaSil(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}