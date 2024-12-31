// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:lottie/lottie.dart';

class CommonWidgets {
  Widget textWidget(
      {text,
      textAlign,
      textColor,
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
          color: textColor, fontSize: textSize, fontWeight: textWeight),
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

  Widget textFieldBox({labelText, fieldIcon, keyboardType, passwordText, validation,controller }) {
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
