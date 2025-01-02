import 'package:get/get.dart';

import '../Helpers/student_coures.dart';

class StudentAllcoureseslistController extends GetxController {
  var selectedTutor = Rxn<StudentCoures>();
  RxInt selectedIndex = 0.obs;

  void selectTutor(StudentCoures tutor) {
    selectedTutor.value = tutor;
  }

  var courses = <StudentCoures>[
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Introduction to Photography and Editing',
        author: 'Eleanor Pena · 3 hr',
        price: '\$10.99',
        originalPrice: '\$32',
        rating: '4.5 (2,980)',
        tag: 'Bestseller',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Advanced Front-End Programming Techniques',
        author: 'Julia Anatole · 1 hr',
        price: '\$10.99',
        originalPrice: '\$32',
        rating: '4.5 (2,980)',
        tag: 'Top Author',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Artificial Intelligence with Python',
        author: 'Jenny Wilson · 1:30 hr',
        price: '\$10.99',
        originalPrice: '\$32',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Ultimate Cybersecurity Fundamental for Beginners',
        author: 'Jacob Jones · 3:30 hr',
        price: '\$10.99',
        originalPrice: '\$32',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Cooking Gourmet Meals at Home',
        author: 'Cameron Williamson · 2 hr',
        price: '\$10.99',
        originalPrice: '\$32',
        rating: '4.5 (2,980)',
        tag: 'Editors Choice',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Creative Writing, From Idea to Manuscript',
        author: 'Kristin Watson · 50 m',
        price: '\$10.99',
        originalPrice: '\$32',
        rating: '4.5 (2,980)',
        tag: 'Most Popular',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    StudentCoures(
        image: 'assets/images/python.png',
        title: 'Personal Finance Management Essentials',
        author: 'Arlene McCoy · 30 m',
        price: '\$10.99',
        originalPrice: '\$32',
        rating: '4.5 (2,980)',
        tag: 'Top Author',
        details:
            'The Advanced Front-End Programming course sharpens students critical thinking, creativity, and analytical skills, empowering them to effectively tackle complex challenges in web development.'),
    // Add other courses similarly
  ].obs;
}
