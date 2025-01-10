// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/staff_profile_controller.dart';
import 'staff_changeprofile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.loadProfileDetails();
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Get.to(() => StaffEditProfileScreen());
              },
              child: Icon(
                Icons.edit_square,
                size: 25,
              ),
            ),
          )
        ],
        title: CommonWidgets().textWidget(
            text: 'Profile',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.25,
                    child: Stack(
                      children: [
                        Obx(() => CircleAvatar(
                              radius: 40,
                              backgroundImage: controller
                                      .selectedImagePath.value.isEmpty
                                  ? NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Hb5xzFZJCTW4cMqmPwsgfw-gILUV7QevvQ&s")
                                  : FileImage(File(
                                          controller.selectedImagePath.value))
                                      as ImageProvider,
                            )),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => showImageSourceDialog(context),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.blue, width: 1.0),
                              ),
                              child: Icon(
                                Icons.add_a_photo,
                                size: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => CommonWidgets().textWidget(
                              text:
                                  " ${controller.name.value.isNotEmpty ? controller.name.value : "Guest"}",
                              textSize: 17.0,
                              textmaxLine: 2,
                              textoverFlow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              textWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CommonWidgets().textWidget(
                  text: controller.description.value,
                  textSize: 13.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w500),
            ),
            SizedBox(width: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.assignment,
                  color: AppColors.btnBlue,
                ),
                contentPadding: EdgeInsets.zero,
                minTileHeight: 0,
                // onTap: () {
                //   Get.to(() => PersonalInformationPage());
                // },
                title: CommonWidgets().textWidget(
                    text: "My Credentials",
                    textSize: 14.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 1,
                    textWeight: FontWeight.w600),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            Divider(
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.edit,
                  color: AppColors.btnBlue,
                ),
                contentPadding: EdgeInsets.zero,
                minTileHeight: 0,
                // onTap: () {
                //   Get.to(() => PersonalInformationPage());
                // },
                title: CommonWidgets().textWidget(
                    text: "Edit Profile",
                    textSize: 14.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 1,
                    textWeight: FontWeight.w600),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            Divider(
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: AppColors.btnBlue,
                ),
                contentPadding: EdgeInsets.zero,
                minTileHeight: 0,
                // onTap: () {
                //   Get.to(() => PersonalInformationPage());
                // },
                title: CommonWidgets().textWidget(
                    text: "Settings",
                    textSize: 14.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 1,
                    textWeight: FontWeight.w600),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            Divider(
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.chat,
                  color: AppColors.btnBlue,
                ),
                contentPadding: EdgeInsets.zero,
                minTileHeight: 0,
                // onTap: () {
                //   Get.to(() => PersonalInformationPage());
                // },
                title: CommonWidgets().textWidget(
                    text: "Need Help? Chat with us",
                    textSize: 14.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 1,
                    textWeight: FontWeight.w600),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            Divider(
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: AppColors.btnBlue,
                ),
                contentPadding: EdgeInsets.zero,
                minTileHeight: 0,
                // onTap: () {
                //   Get.to(() => PersonalInformationPage());
                // },
                title: CommonWidgets().textWidget(
                    text: "Educator Status",
                    textSize: 14.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 1,
                    textWeight: FontWeight.w600),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            Divider(
              indent: 8,
              endIndent: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                leading: Icon(
                  Icons.payment,
                  color: AppColors.btnBlue,
                ),
                contentPadding: EdgeInsets.zero,
                minTileHeight: 0,
                // onTap: () {
                //   Get.to(() => PersonalInformationPage());
                // },
                title: CommonWidgets().textWidget(
                    text: "Billing Information",
                    textSize: 14.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 1,
                    textWeight: FontWeight.w600),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
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
