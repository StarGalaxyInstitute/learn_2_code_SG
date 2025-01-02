import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Students_App/Screens/student_dashboard.dart';

import '../../Constrant/preferences.dart';
import '../../Constrant/utilities.dart';

class StudentAuthcontroller extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();

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
    } else if (formKey.currentState!.validate()) {
      Get.offAll(StudentDashboard());
      Preference.preference.saveBool(PrefernceKey.isStudentFlow, true);
    }
  }
}
