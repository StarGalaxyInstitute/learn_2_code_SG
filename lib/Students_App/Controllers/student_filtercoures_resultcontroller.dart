import 'package:get/get.dart';

import '../Helpers/student_coures.dart';

class StudentFiltercouresresultcontroller extends GetxController {
  var courses = <StudentCoures>[
    StudentCoures(
            id: "1",
      image: 'assets/images/javascript.png',
      title: 'JavaScript for Modern Web Development',
      author: 'Robert Fox - 3 hr',
      price: '\$10.99',
      details: '',
      originalPrice: '\$32',
      rating: '4.5 (2,980)',
      tag: 'Top Author',
    ),
    StudentCoures(
            id: "2",
      image: 'assets/images/python.png',
      title: 'Python Programming for Data Analysis',
      author: 'Eleanor Pena - 3 hr',
      price: '\$10.99',
       details: '',
      originalPrice: '\$32',
      rating: '4.5 (2,980)',
      tag: 'Top Author',
    ),
    StudentCoures(
            id: "3",
      image: 'assets/images/javascript.png',
      title: 'Python Programming for Data Analysis',
      author: 'Eleanor Pena - 3 hr',
      price: '\$10.99',
      originalPrice: '\$32',
       details: '',
      rating: '4.5 (2,980)',
      tag: 'Editors Choice',
    ),
    StudentCoures(
            id: "4",
      image: 'assets/images/python.png',
      title: 'Python Programming for Data Analysis',
      author: 'Eleanor Pena - 3 hr',
      price: '\$10.99',
      originalPrice: '\$32',
       details: '',
      rating: '4.5 (2,980)',
      tag: 'Top Author',
    ),
    StudentCoures(
       id: "5",
      image: 'assets/images/javascript.png',
      title: 'Python Programming for Data Analysis',
      author: 'Eleanor Pena - 3 hr',
      price: '\$10.99',
      originalPrice: '\$32',
       details: '',
      rating: '4.5 (2,980)',
      tag: 'Top Author',
    ),
    // Add other courses similarly
  ].obs;
}
