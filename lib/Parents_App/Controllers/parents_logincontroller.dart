import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/parents_otp_screen.dart';

class ParentsLogincontroller extends GetxController {
  TextEditingController phonecontroller = TextEditingController();

  TextEditingController otpcontroller = TextEditingController();

  var selectedCountry = {"name": "India", "code": "+91"}.obs; // Default country
  var generatedOtp = ''.obs;

  void setSelectedCountry(String name, String code) {
    selectedCountry.value = {"name": name, "code": code};
  }

  void verifyPhoneNumber() {
    if (phonecontroller.text.isEmpty || phonecontroller.text.length < 10) {
      Get.snackbar("Invalid Input", "Please enter a valid phone number.");
    } else {
      generateRandomOtp();
      Get.to(ParentsOtpScreen());
    }
  }

  void generateRandomOtp() {
    final random = Random();
    generatedOtp.value =
        (random.nextInt(9000) + 1000).toString(); // Generate 4-digit OTP
  }
}
