import 'package:get/get.dart';

class Tutor {
  final String name;
  final String subject;
  final String university;
  final String details;
  final String collagedegree;
  final String schooldegree;
  final String schoolyear;
  final String collageyear;
  final String schoolname;
  final double hourlyRate;
  final double discountedRate;
  final double rating;
  final int reviewscount;
  final List reviews;

  Tutor({
    required this.name,
    required this.reviewscount,
    required this.university,
    required this.collagedegree,
    required this.schooldegree,
    required this.schoolyear,
    required this.collageyear,
    required this.schoolname,
    required this.hourlyRate,
    required this.details,
    required this.subject,
    required this.discountedRate,
    required this.rating,
    required this.reviews,
  });
}

class StudentToplivetutorController extends GetxController {
  var selectedTutor = Rxn<Tutor>();

  void selectTutor(Tutor tutor) {
    selectedTutor.value = tutor;
  }

  var tutors = <Tutor>[
    Tutor(
      name: "Robert Fox",
      university: "University of Oxford",
      hourlyRate: 30.0,
      discountedRate: 49.0,
      rating: 4.5,
      details:
          "I'm Robert Fox, an architect passionate about teaching. As the lead instructor, I've helped many students and taught at top companies worldwide.",
      subject: "Math 116",
      reviewscount: 39,
      schooldegree: "SSC",
      collagedegree: "Engineering",
      collageyear: "2020 - 2024",
      schoolyear: "2019",
      schoolname: "Hobbition High School",
      reviews: [
        {
          "name": "Naomi Klein",
          "date": "16 Feb 2024",
          "feedback":
              "I wish Robert Fox was my class teacher. His teaching technique is awesome."
        },
        {
          "name": "Muhammad Shahin",
          "date": "16 Feb 2024",
          "feedback":
              "Robert Fox's teaching is outstanding. He makes learning complex topics simple and enjoyable."
        },
      ],
    ),
    Tutor(
      name: "Esther Howard",
      university: "University of Yorkshire",
      hourlyRate: 28.0,
      discountedRate: 40.0,
      rating: 4.5,
      details:
          "I'm Esther Howard, an architect passionate about teaching. As the lead instructor, I've helped many students and taught at top companies worldwide.",
      subject: "Math 116",
       schooldegree: "HSC",
      collagedegree: "Engineering",
      collageyear: "2020 - 2024",
      schoolyear: "2019",
      schoolname: "Hobbition High School",
      reviewscount: 39,
      reviews: [
        {
          "name": "Naomi Klein",
          "date": "16 Feb 2024",
          "feedback":
              "I wish Robert Fox was my class teacher. His teaching technique is awesome."
        },
        {
          "name": "Muhammad Shahin",
          "date": "16 Feb 2024",
          "feedback":
              "Robert Fox's teaching is outstanding. He makes learning complex topics simple and enjoyable."
        },
      ],
    ),
    Tutor(
      name: "Guy Hawkins",
      university: "University of London",
      hourlyRate: 24.0,
      discountedRate: 32.0,
      rating: 4.5,
       schooldegree: "SSC",
      collagedegree: "MSC",
      collageyear: "2020 - 2024",
      schoolyear: "2019",
      schoolname: "Hobbition High School",
      details:
          "I'm Guy Hawkins, an architect passionate about teaching. As the lead instructor, I've helped many students and taught at top companies worldwide.",
      subject: "Math 116",
      reviewscount: 39,
      reviews: [
        {
          "name": "Naomi Klein",
          "date": "16 Feb 2024",
          "feedback":
              "I wish Robert Fox was my class teacher. His teaching technique is awesome."
        },
        {
          "name": "Muhammad Shahin",
          "date": "16 Feb 2024",
          "feedback":
              "Robert Fox's teaching is outstanding. He makes learning complex topics simple and enjoyable."
        },
      ],
    ),
    Tutor(
      name: "Darrel Steward",
      university: "Københavns Universitet",
      hourlyRate: 21.0,
      discountedRate: 28.0,
      rating: 4.5,
       schooldegree: "SSC",
      collagedegree: "Engineering",
      collageyear: "2020 - 2024",
      schoolyear: "2019",
      schoolname: "Hobbition High School",
      details:
          "I'm Darrel Steward, an architect passionate about teaching. As the lead instructor, I've helped many students and taught at top companies worldwide.",
      subject: "Math 116",
      reviewscount: 39,
      reviews: [
        {
          "name": "Naomi Klein",
          "date": "16 Feb 2024",
          "feedback":
              "I wish Robert Fox was my class teacher. His teaching technique is awesome."
        },
        {
          "name": "Muhammad Shahin",
          "date": "16 Feb 2024",
          "feedback":
              "Robert Fox's teaching is outstanding. He makes learning complex topics simple and enjoyable."
        },
      ],
    ),
    Tutor(
      name: "Guy Hawkins",
      university: "Aarhus Universitet",
      hourlyRate: 30.0,
      discountedRate: 36.0,
      rating: 4.5,
       schooldegree: "SSC",
      collagedegree: "Engineering",
      collageyear: "2020 - 2024",
      schoolyear: "2019",
      schoolname: "Hobbition High School",
      details:
          "I'm Guy Hawkins, an architect passionate about teaching. As the lead instructor, I've helped many students and taught at top companies worldwide.",
      subject: "Math 116",
      reviewscount: 39,
      reviews: [
        {
          "name": "Naomi Klein",
          "date": "16 Feb 2024",
          "feedback":
              "I wish Robert Fox was my class teacher. His teaching technique is awesome."
        },
        {
          "name": "Muhammad Shahin",
          "date": "16 Feb 2024",
          "feedback":
              "Robert Fox's teaching is outstanding. He makes learning complex topics simple and enjoyable."
        },
      ],
    ),
  ].obs;
}
