// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/staff_profile_controller.dart';
import 'staff_personaldetails_screen.dart';

class StaffEditProfileScreen extends StatefulWidget {
  @override
  _StaffEditProfileScreenState createState() => _StaffEditProfileScreenState();
}

class _StaffEditProfileScreenState extends State<StaffEditProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  var completedSteps = 0.obs; // Track completed steps

  @override
  void initState() {
    super.initState();
    nameController.text = profileController.name.value;
    birthdateController.text = profileController.birthdate.value;
    qualificationController.text = profileController.qualification.value;
    skillsController.text = profileController.skills.value;

    // Add listeners to detect field changes
    nameController.addListener(updateCompletedSteps);
    birthdateController.addListener(updateCompletedSteps);
    qualificationController.addListener(updateCompletedSteps);
    skillsController.addListener(updateCompletedSteps);

    // Initial calculation of completed steps
    updateCompletedSteps();
  }

  void updateCompletedSteps() {
    int steps = 0;
    if (nameController.text.isNotEmpty) steps++;
    if (birthdateController.text.isNotEmpty) steps++;
    if (qualificationController.text.isNotEmpty) steps++;
    if (skillsController.text.isNotEmpty) steps++;
    completedSteps.value = steps;
  }

  @override
  void dispose() {
    nameController.dispose();
    birthdateController.dispose();
    qualificationController.dispose();
    skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: "Edit Profile", textSize: 18.0, textWeight: FontWeight.w600),
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonWidgets().textWidget(
                    text: "your Profile Complate ${completedSteps.value} %",
                    textSize: 14.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 1,
                    textWeight: FontWeight.w600),
                SizedBox(height: 10),
                // Step Progress Indicator
                StepProgressIndicator(
                  totalSteps: 4,
                  currentStep: completedSteps.value,
                  size: 8,
                  padding: 0,
                  selectedColor: Colors.green,
                  unselectedColor: Colors.grey[300]!,
                  roundedEdges: Radius.circular(10),
                ),
                SizedBox(height: 20),
                // Input fields
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: birthdateController,
                  decoration: const InputDecoration(
                    labelText: "Birthdate",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: qualificationController,
                  decoration: const InputDecoration(
                    labelText: "Qualification",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: skillsController,
                  decoration: const InputDecoration(
                    labelText: "Skills",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () async {
                    // Save the updated profile details
                    await profileController.saveProfileDetails(
                      name: nameController.text,
                      birthdate: birthdateController.text,
                      qualification: qualificationController.text,
                      skills: skillsController.text,
                    );

                    // Reset progress and navigate to the PersonalDetailsScreen
                    completedSteps.value = 0;
                    Get.off(() => PersonalDetailsScreen());
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.btnBlue),
                    child: Center(
                      child: CommonWidgets().textWidget(
                          text: 'Save Changes',
                          textColor: AppColors.whitecolor,
                          textAlign: TextAlign.start,
                          textSize: 14.0,
                          textWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
