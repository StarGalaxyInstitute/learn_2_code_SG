import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var birthdate = ''.obs;
  var qualification = ''.obs;
  var skills = ''.obs;
  var progress = 0.0.obs; // Progress value
  var isSetupComplete = false.obs; // Flag for setup completion
  var selectedImagePath = ''.obs;
  var description =
      'Recipient of the official YouTube gold button for UPSC series. Unacademy \'Educator of the Month\' for Feb\'22. Worked at Spipa, Delhi.'
          .obs;

  Future<void> loadProfileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    birthdate.value = prefs.getString('birthdate') ?? '';
    qualification.value = prefs.getString('qualification') ?? '';
    skills.value = prefs.getString('skills') ?? '';
    isSetupComplete.value = prefs.getBool('isSetupComplete') ?? false;

    calculateProgress();
  }
  void updateImagePath(String path) {
    selectedImagePath.value = path;
  }
  Future<void> saveProfileDetails({
    required String name,
    required String birthdate,
    required String qualification,
    required String skills,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    this.name.value = name;
    this.birthdate.value = birthdate;
    this.qualification.value = qualification;
    this.skills.value = skills;
    await prefs.setString('name', name);
    await prefs.setString('birthdate', birthdate);
    await prefs.setString('qualification', qualification);
    await prefs.setString('skills', skills);
    calculateProgress();
  }

  Future<void> markSetupComplete() async {
    final prefs = await SharedPreferences.getInstance();
    isSetupComplete.value = true;
    await prefs.setBool('isSetupComplete', true);
  }

  void calculateProgress() {
    int completedSteps = 0;
    if (name.isNotEmpty) completedSteps++;
    if (birthdate.isNotEmpty) completedSteps++;
    if (qualification.isNotEmpty) completedSteps++;
    if (skills.isNotEmpty) completedSteps++;
    progress.value = completedSteps / 4; // 4 steps in total
  }
}
