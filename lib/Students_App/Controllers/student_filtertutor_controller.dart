// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentFiltertutorcontroller extends GetxController {
  var isLookingForTutor = true.obs;
  var selectedSubject = 'MAT 116'.obs;
  var selectedDays = <String>[].obs;
  var selectedTimeslot = ''.obs;
  var experience = '1-3 Years'.obs;
  var degree = "Master's in Applied Mathematics".obs;
  var rating = 3.obs;
  bool isfilterTab = true;

  var selectedCategory = "Programming".obs;
  var selectedDifficulty = "Beginner".obs;
  var selectedRating = 3.obs;
  var priceRange = RangeValues(12, 29).obs;
  var selectedDuration = "3-6 hrs".obs;
  var selectedRelease = "In last 6 Month".obs;

  void resetFilters2() {
    selectedCategory.value = "Programming";
    selectedDifficulty.value = "Beginner";
    selectedRating.value = 3;
    priceRange.value = RangeValues(12, 29);
    selectedDuration.value = "3-6 hrs";
    selectedRelease.value = "In last 6 Month";
  }

  void resetFilters() {
    isLookingForTutor.value = true;
    selectedSubject.value = 'MAT 116';
    selectedDays.clear();
    selectedTimeslot.value = '';
    experience.value = '1-3 Years';
    degree.value = "Master's in Applied Mathematics";
    rating.value = 3;
  }
}
