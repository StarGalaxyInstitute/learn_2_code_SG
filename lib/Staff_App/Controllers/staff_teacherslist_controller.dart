import 'package:get/get.dart';

// Model class for a Teacher
class Teacher {
  final String name;
  final String subject;
  final String location;
  final String subjects;
  final String rating;
  final String reviews;
  final String salary;
  final String graduation;
  final String about;

  Teacher({
    required this.name,
    required this.subject,
    required this.location,
    required this.subjects,
    required this.rating,
    required this.reviews,
    required this.salary,
    required this.graduation,
    required this.about,
  });
}

// Controller for managing teachers
class StaffTeacherslistController extends GetxController {
  var selectedTutor = Rxn<Teacher>();
  var selectedSubject = ''.obs;

  void selectIndex(Teacher tutor) {
    selectedTutor.value = tutor;
  }

  var teacherList = <Teacher>[
    Teacher(
        name: "Shohag Hasan",
        subject: "Mathematics",
        subjects: 'English , Math , Physics',
        rating: '4.8',
        about:
            'Lorem ipsum dolor sit amet consectetur. Venantis mi adipiscing morbi ullamcorper cras imperdiet adipiscing.',
        graduation: 'Graduated from Dhaka University',
        reviews: '30',
        salary: '1500',
        location: "Uttara, Sector 06, Dhaka"),
    Teacher(
        name: "Hridoy Ahmed",
        subject: "English",
         subjects: 'English , Math , Physics',
        rating: '4.8',
        about:
            'Lorem ipsum dolor sit amet consectetur. Venantis mi adipiscing morbi ullamcorper cras imperdiet adipiscing.',
        graduation: 'Graduated from Dhaka University',
        reviews: '30',
        salary: '1500',
        location: "Gulshan 02, Dhaka"),
    Teacher(
        name: "Shahin Alom",
        subject: "Mathematics",
         subjects: 'English , Math , Physics',
        rating: '4.8',
        about:
            'Lorem ipsum dolor sit amet consectetur. Venantis mi adipiscing morbi ullamcorper cras imperdiet adipiscing.',
        graduation: 'Graduated from Dhaka University',
        reviews: '30',
        salary: '1500',
        location: "Uttara, Sector 06, Dhaka"),
    Teacher(
        name: "Rakib Hossain",
        subject: "English",
         subjects: 'English , Math , Physics',
        rating: '4.8',
        about:
            'Lorem ipsum dolor sit amet consectetur. Venantis mi adipiscing morbi ullamcorper cras imperdiet adipiscing.',
        graduation: 'Graduated from Dhaka University',
        reviews: '30',
        salary: '1500',
        location: "Gulshan 02, Dhaka"),
    Teacher(
        name: "Shamim Patwari",
        subject: "Mathematics",
         subjects: 'English , Math , Physics',
        rating: '4.8',
        about:
            'Lorem ipsum dolor sit amet consectetur. Venantis mi adipiscing morbi ullamcorper cras imperdiet adipiscing.',
        graduation: 'Graduated from Dhaka University',
        reviews: '30',
        salary: '1500',
        location: "Uttara, Sector 06, Dhaka"),
    Teacher(
        name: "Khairul Islam",
        subject: "English",
         subjects: 'English , Math , Physics',
        rating: '4.8',
        about:
            'Lorem ipsum dolor sit amet consectetur. Venantis mi adipiscing morbi ullamcorper cras imperdiet adipiscing.',
        graduation: 'Graduated from Dhaka University',
        reviews: '30',
        salary: '1500',
        location: "Gulshan 02, Dhaka"),
    Teacher(
        name: "Minhazul Islam",
        subject: "Mathematics",
         subjects: 'English , Math , Physics',
        rating: '4.8',
        about:
            'Lorem ipsum dolor sit amet consectetur. Venantis mi adipiscing morbi ullamcorper cras imperdiet adipiscing.',
        graduation: 'Graduated from Dhaka University',
        reviews: '30',
        salary: '1500',
        location: "Uttara, Sector 06, Dhaka"),
  ].obs;
}
