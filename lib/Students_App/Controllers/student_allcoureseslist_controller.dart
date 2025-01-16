import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helpers/student_coures.dart';

class ItemData {
  String? name;
  Icon? icon;
  String? time;
  ItemData({this.name, this.icon, this.time});
}

class StudentAllcoureseslistController extends GetxController {
  var selectedTutor = Rxn<StudentCoures>();
  RxInt selectedIndex = 0.obs;
  var favoriteCourses = <StudentCoures>[].obs; // Observable list for favorites

  void selectTutor(StudentCoures tutor) {
    selectedTutor.value = tutor;
  }

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  List<ItemData> iconlist = [
    ItemData(
        name: 'Lifetime access',
        icon: Icon(Icons.menu_book_rounded,
            size: 22, color: AppColors.blackcolor)),
    ItemData(
        name: '23 Readings',
        icon: Icon(Icons.insert_drive_file_rounded,
            size: 22, color: AppColors.blackcolor)),
    ItemData(
        name: '39 Assignments',
        icon: Icon(Icons.note_alt_rounded,
            size: 22, color: AppColors.blackcolor)),
    ItemData(
        name: 'Certificate of achievement',
        icon: Icon(Icons.request_quote_outlined,
            size: 22, color: AppColors.blackcolor)),
    ItemData(
        name: '54 Downloadable',
        icon: Icon(Icons.download, size: 22, color: AppColors.blackcolor)),
  ];

  List<ItemData> coursemateriallist = [
    ItemData(
        name: 'HTML and CSS Basics',
        icon: Icon(Icons.play_circle_outline_sharp, size: 25),
        time: '4:30'),
    ItemData(
        name: 'JavaScript & DOM',
        icon: Icon(Icons.play_circle_outline_sharp, size: 25),
        time: '5:15'),
    ItemData(
        name: 'Responsive Design',
        icon: Icon(Icons.play_circle_outline_sharp, size: 25),
        time: '2:40'),
    ItemData(
        name: 'Advanced JavaScript',
        icon: Icon(Icons.insert_drive_file_rounded, size: 25),
        time: '6:28'),
    ItemData(
        name: 'Assignements',
        icon: Icon(Icons.light_mode_sharp, size: 25),
        time: '5 Questions'),
    ItemData(
        name: 'React UI Building',
        icon: Icon(Icons.play_circle_outline_sharp, size: 25),
        time: '4:50'),
  ];

  var courses = <StudentCoures>[
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Introduction to Photography and Editing',
        author: 'Eleanor Pena · 3 hr',
        rating: '4.5 (2,980)',
        tag: 'Bestseller',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Advanced Front-End Programming Techniques',
        author: 'Julia Anatole · 1 hr',
        rating: '4.5 (2,980)',
        tag: 'Top Author',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Artificial Intelligence with Python',
        author: 'Jenny Wilson · 1:30 hr',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Ultimate Cybersecurity Fundamental for Beginners',
        author: 'Jacob Jones · 3:30 hr',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Cooking Gourmet Meals at Home',
        author: 'Cameron Williamson · 2 hr',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Creative Writing, From Idea to Manuscript',
        author: 'Kristin Watson · 50 m',
        rating: '4.5 (2,980)',
        tag: 'Most Popular',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Personal Finance Management Essentials',
        author: 'Arlene McCoy · 30 m',
        rating: '4.5 (2,980)',
        tag: 'Top Author',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
  ].obs;

  // Future<void> loadFavorites() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? favoritesData = prefs.getString('favoriteCourses');
  //   if (favoritesData != null) {
  //     List<dynamic> jsonList = jsonDecode(favoritesData);
  //     for (var course in courses) {
  //       course.isFavorite =jsonList.any((item) => item['title'] == course.title);
  //     }
  //   }
  //   favoriteCourses.value = courses.where((c) => c.isFavorite).toList();
  //   update();
  // }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favoritesData = prefs.getString('favoriteCourses');
    if (favoritesData != null) {
      List<dynamic> jsonList = jsonDecode(favoritesData);
      for (var course in courses) {
        course.isFavorite =
            jsonList.any((item) => item['title'] == course.title);
      }
    }
    favoriteCourses.value = courses.where((c) => c.isFavorite).toList();
    update();
  }

  // Future<void> saveFavorites() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<Map<String, dynamic>> favorites = courses.where((course) => course.isFavorite).map((course) => course.toJson()).toList();
  //   prefs.setString('favoriteCourses', jsonEncode(favorites));
  // }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> favorites = courses
        .where((course) => course.isFavorite)
        .map((course) => course.toJson())
        .toList();
    prefs.setString('favoriteCourses', jsonEncode(favorites));
  }

  // void toggleFavorite(StudentCoures course) {
  //   course.isFavorite = !course.isFavorite;
  //   favoriteCourses.value = courses.where((c) => c.isFavorite).toList();
  //   saveFavorites();
  // }

  void toggleFavorite(StudentCoures course) {
    course.isFavorite = !course.isFavorite;
    // Ensure we update selectedTutor if the course is the selected one
    if (selectedTutor.value == course) {
      selectedTutor.value = course;
    }
    favoriteCourses.value = courses.where((c) => c.isFavorite).toList();
    saveFavorites();
    update(); // Ensure the UI is refreshed
  }
}
