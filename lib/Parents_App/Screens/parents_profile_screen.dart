// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/parents_profile_controller.dart';
import 'parents_profileedit_screen.dart';

class ParentsProfileScreen extends StatelessWidget {
  final ParentsProfileController controller =
      Get.put(ParentsProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title: CommonWidgets().textWidget(
          text: "Profile",
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_square, size: 25),
            onPressed: () {
              controller.nameController.text = controller.nameController.text;
              controller.phoneController.text = controller.phoneController.text;

              Get.off(ParentsProfileEditScreen());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Obx(() => CircleAvatar(
                    radius: 70,
                    backgroundImage: controller.selectedImagePath.value.isEmpty
                        ? NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Hb5xzFZJCTW4cMqmPwsgfw-gILUV7QevvQ&s")
                        : FileImage(File(controller.selectedImagePath.value))
                            as ImageProvider,
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => showImageSourceDialog(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 1.0),
                    ),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 17,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.btnborder),
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: CommonWidgets().textWidget(
                  text: 'Name :',
                  textWeight: FontWeight.bold,
                  textmaxLine: 1,
                  textoverFlow: TextOverflow.ellipsis,
                  textSize: 16.0,
                ),
                trailing: CommonWidgets().textWidget(
                  text: controller.nameController.text,
                  textmaxLine: 2,
                  textoverFlow: TextOverflow.ellipsis,
                  textWeight: FontWeight.w600,
                  textSize: 15.0,
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.btnborder),
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: CommonWidgets().textWidget(
                  text: 'Phone Number :',
                  textWeight: FontWeight.bold,
                  textmaxLine: 1,
                  textoverFlow: TextOverflow.ellipsis,
                  textSize: 16.0,
                ),
                trailing: CommonWidgets().textWidget(
                  text: controller.phoneController.text,
                  textmaxLine: 1,
                  textoverFlow: TextOverflow.ellipsis,
                  textWeight: FontWeight.w600,
                  textSize: 15.0,
                )),
          ),
        ],
      ),
    );
  }

  void showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CommonWidgets().textWidget(
          text: "Choose an option",
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: CommonWidgets().textWidget(
                text: "Camera",
                textWeight: FontWeight.bold,
                textSize: 17.0,
              ),
              onTap: () async {
                Navigator.pop(context);
                await pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: CommonWidgets().textWidget(
                text: "Gallery",
                textWeight: FontWeight.bold,
                textSize: 17.0,
              ),
              onTap: () async {
                Navigator.pop(context);
                await pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      controller.updateImagePath(image.path);
    }
  }
}
