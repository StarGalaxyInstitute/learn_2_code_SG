import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/parents_profile_screen.dart';

class ParentsProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var profileImage = ''.obs;
  var selectedImagePath = ''.obs;


  void verifyPhoneNumber() {
    if (phoneController.text.isEmpty || phoneController.text.length < 10) {
      Get.snackbar("Invalid Input", "Please enter a valid phone number.");
    } else {
       saveProfile();
      Get.off(ParentsProfileScreen());
    }
  }



  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }
  void updateImagePath(String path) {
    selectedImagePath.value = path;
  }
  void loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameController.text = prefs.getString('name') ?? 'John Doe';
    phoneController.text = prefs.getString('phone') ?? '+91 1234567890';
    profileImage.value = prefs.getString('profileImage') ?? '';
  }

  void saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('profileImage', profileImage.value);
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = image.path;
      saveProfile();
    }
  }
}
