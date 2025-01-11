// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:lottie/lottie.dart';

class CommonWidgets {
  Widget textWidget(
      {text,
      textAlign,
      textColor,
      textdecoration,
      textSize,
      textWeight,
      textmaxLine,
      textoverFlow}) {
    return Text(
      text,
      maxLines: textmaxLine,
      textAlign: textAlign,
      overflow: textoverFlow,
      style: GoogleFonts.rubik(
          color: textColor,
          fontSize: textSize,
          fontWeight: textWeight,
          decoration: textdecoration),
    );
  }

  Future<bool?> toast({toastMsg, toastColor}) {
    return Fluttertoast.showToast(
        msg: toastMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget loader() {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Center(
            child: Lottie.asset(AppImage.icons + "loader.json",
                frameRate: FrameRate(120), height: 100)),
      ),
    );
  }

  Widget willpopdialog() {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentTextStyle: GoogleFonts.rubik(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text('Quit App?',
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(fontWeight: FontWeight.bold)),
      content: Text(
        'Are you sure you want exit!',
        textAlign: TextAlign.center,
        style: GoogleFonts.rubik(
            color: AppColors.greycolor, fontWeight: FontWeight.w600),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  exit(1);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.btnBlue),
                  child: Center(
                    child: CommonWidgets().textWidget(
                        text: 'Yes',
                        textColor: AppColors.whitecolor,
                        textAlign: TextAlign.start,
                        textSize: 14.0,
                        textWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.btnBlue),
                  child: Center(
                    child: CommonWidgets().textWidget(
                        text: 'No',
                        textColor: AppColors.whitecolor,
                        textAlign: TextAlign.start,
                        textSize: 14.0,
                        textWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget textFieldBox(
      {labelText,
      fieldIcon,
      keyboardType,
      passwordText,
      validation,
      controller}) {
    return TextFormField(
      style: GoogleFonts.rubik(
        fontSize: 18,
      ),
      controller: controller,
      validator: validation,
      obscureText: passwordText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.darkBlue,
        ),
        suffixIcon: Icon(
          fieldIcon,
          color: Colors.blueGrey,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
        ),
      ),
    );
  }
}
