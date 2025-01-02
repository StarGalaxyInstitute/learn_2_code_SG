import 'package:get/get.dart';
import '../Helpers/student_tutormodel.dart';

class StudentFiltertutorresultcontroller extends GetxController {
  final searchQuery = ''.obs;
  final tutors = <StudentTutormodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTutors();
  }

  void fetchTutors() {
    tutors.assignAll([
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Eleanor Pena',
          university: 'Københavns Universitet',
          rating: 5.0,
          reviews: 41,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Robert Fox',
          university: 'University of Oxford',
          rating: 4.5,
          reviews: 39,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Dianne Russell',
          university: 'Sydansk Universitet',
          rating: 4.4,
          reviews: 27,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Guy Hawkins',
          university: 'Aarhus Universitet',
          rating: 4.2,
          reviews: 21,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Julia Anatole',
          university: 'Harvard Business School',
          rating: 4.0,
          reviews: 17,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Albert Flores',
          university: 'Wake Forest University',
          rating: 4.0,
          reviews: 12,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Eleanor Pena',
          university: 'Københavns Universitet',
          rating: 5.0,
          reviews: 41,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Robert Fox',
          university: 'University of Oxford',
          rating: 4.5,
          reviews: 39,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Dianne Russell',
          university: 'Sydansk Universitet',
          rating: 4.4,
          reviews: 27,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Guy Hawkins',
          university: 'Aarhus Universitet',
          rating: 4.2,
          reviews: 21,
          hourlyRate: 30,
          oldRate: 36),
      StudentTutormodel(
          image: 'assets/images/javascript.png',
          name: 'Julia Anatole',
          university: 'Harvard Business School',
          rating: 4.0,
          reviews: 17,
          hourlyRate: 30,
          oldRate: 36),
    ]);
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
