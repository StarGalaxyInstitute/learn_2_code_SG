// ignore_for_file: prefer_const_constructors

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
  ItemData({
    this.name,
    this.icon,
    this.time,
  });
}

class StudentAllcoureseslistController extends GetxController {
  var selectedTutor = Rxn<StudentCoures>();
  RxInt selectedIndex = 0.obs;
  RxList<String> favoriteIds = <String>[].obs;

  void selectTutor(StudentCoures tutor) {
    selectedTutor.value = tutor;
  }

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> toggleFavorite(String id) async {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
    await saveFavorites();
  }

  bool isFavorite(String id) {
    return favoriteIds.contains(id);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', favoriteIds);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    favoriteIds.value = prefs.getStringList('favorites') ?? [];
  }

  List<ItemData> iconlist = [
    ItemData(
        name: 'Lifetime access',
        icon: Icon(
          Icons.menu_book_rounded,
          size: 22,
          color: AppColors.blackcolor,
        )),
    ItemData(
        name: '23 Readings',
        icon: Icon(
          Icons.insert_drive_file_rounded,
          size: 22,
          color: AppColors.blackcolor,
        )),
    ItemData(
        name: '39 Assignments',
        icon: Icon(
          Icons.note_alt_rounded,
          size: 22,
          color: AppColors.blackcolor,
        )),
    ItemData(
        name: 'Certificate of achievement',
        icon: Icon(
          Icons.request_quote_outlined,
          size: 22,
          color: AppColors.blackcolor,
        )),
    ItemData(
        name: '54 Downloadable',
        icon: Icon(
          Icons.download,
          size: 22,
          color: AppColors.blackcolor,
        )),
  ];

  List<ItemData> coursemateriallist = [
    ItemData(
        name: 'HTML and CSS Basics',
        icon: Icon(
          Icons.play_circle_outline_sharp,
          size: 25,
        ),
        time: '4:30'),
    ItemData(
        name: 'JavaScript & DOM',
        icon: Icon(
          Icons.play_circle_outline_sharp,
          size: 25,
        ),
        time: '5:15'),
    ItemData(
        name: 'Responsive Design',
        icon: Icon(
          Icons.play_circle_outline_sharp,
          size: 25,
        ),
        time: '2:40'),
    ItemData(
        name: 'Advanced JavaScript',
        icon: Icon(
          Icons.insert_drive_file_rounded,
          size: 25,
        ),
        time: '6:28'),
    ItemData(
        name: 'Assignements',
        icon: Icon(
          Icons.light_mode_sharp,
          size: 25,
        ),
        time: '5 Questions'),
    ItemData(
        name: 'React UI Building',
        icon: Icon(
          Icons.play_circle_outline_sharp,
          size: 25,
        ),
        time: '4:50'),
  ];

  var courses = <StudentCoures>[
    StudentCoures(
        id: "1",
        image: 'assets/images/python.png',
        title: 'Introduction to Photography and Editing',
        author: 'Eleanor Pena · 3 hr',
        rating: '4.5 (2,980)',
        tag: 'Bestseller',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        id: "2",
        image: 'assets/images/python.png',
        title: 'Advanced Front-End Programming Techniques',
        author: 'Julia Anatole · 1 hr',
        rating: '4.5 (2,980)',
        tag: 'Top Author',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        id: "3",
        image: 'assets/images/python.png',
        title: 'Artificial Intelligence with Python',
        author: 'Jenny Wilson · 1:30 hr',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        id: "4",
        image: 'assets/images/python.png',
        title: 'Ultimate Cybersecurity Fundamental for Beginners',
        author: 'Jacob Jones · 3:30 hr',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        id: "5",
        image: 'assets/images/python.png',
        title: 'Cooking Gourmet Meals at Home',
        author: 'Cameron Williamson · 2 hr',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        id: "6",
        image: 'assets/images/python.png',
        title: 'Creative Writing, From Idea to Manuscript',
        author: 'Kristin Watson · 50 m',
        rating: '4.5 (2,980)',
        tag: 'Most Popular',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        id: "7",
        image: 'assets/images/python.png',
        title: 'Personal Finance Management Essentials',
        author: 'Arlene McCoy · 30 m',
        rating: '4.5 (2,980)',
        tag: 'Top Author',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
  ].obs;
}
