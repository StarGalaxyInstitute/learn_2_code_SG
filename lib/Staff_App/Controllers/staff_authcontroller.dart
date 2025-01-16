// ignore_for_file: body_might_complete_normally_nullable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constrant/preferences.dart';
import '../../Constrant/utilities.dart';
import '../Screens/staff_dashboard.dart';
import '../Screens/staff_prosesspage.dart';

class StaffAuthcontroller extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: "admin@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "Admin@1234");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "Admin@1234");
  final TextEditingController userNameController =
      TextEditingController(text: "Admins");

  var isaccess =
      Preference.preference.getBool(key: PrefernceKey.isaccess, defVal: false);

  String? validationCheck() {
    String email = emailController.text;
    String password = passwordController.text;
    String useername = userNameController.text;
    String confirmpassword = confirmPasswordController.text;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (useername.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      Get.snackbar("Register", "please Enter Text");
    } else if (!emailRegex.hasMatch(email)) {
      Get.snackbar("Register", "Enter a valid email address");
    } else if (!RegExp(r'[A-Z]').hasMatch(useername)) {
      Get.snackbar(
          "Register", "UserName must contain at least one uppercase letter");
    } else if (useername.length < 6) {
      Get.snackbar("Register", "UserName must be at least 6 characters long");
    } else if (password.length < 8) {
      Get.snackbar("Register", "Password must be at least 8 characters long");
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      Get.snackbar(
          "Register", "Password must contain at least one uppercase letter");
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      Get.snackbar(
          "Register", "Password must contain at least one lowercase letter");
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      Get.snackbar("Register", "Password must contain at least one number");
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      Get.snackbar(
          "Register", "Password must contain at least one special character");
    } else if (email == password) {
      Get.snackbar("Fail", "Email And Password Not Same");
    } else if (confirmpassword != password) {
      Get.snackbar("Register", "Password and Confirm Password do not match");
    } else if (useername == password) {
      Get.snackbar("Register", "Password and UserName Not Same");
    } else if (formKey.currentState!.validate() || isaccess == false) {
      Get.offAll(StaffProcesspage());
      Get.snackbar("Register", "Access False");
    } else if (formKey.currentState!.validate() || isaccess == true) {
      Get.offAll(StaffDashboard());
      Get.snackbar("Register", "Access True");
    } else {
      Get.snackbar("Register", "else");
    }
  }
}
