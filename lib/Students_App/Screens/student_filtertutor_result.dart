import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constrant/utilities.dart';
import '../Controllers/student_filtertutor_resultcontroller.dart';
import '../Helpers/student_tutormodel.dart';

class StudentFiltertutorResult extends StatelessWidget {
  final StudentFiltertutorresultcontroller controller =
      Get.put(StudentFiltertutorresultcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Filtered Results', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchWidget(),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.tutors.length,
                itemBuilder: (context, index) {
                  final tutor = controller.tutors[index];
                  return TutorCard(tutor: tutor);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

Widget searchWidget() {
  return Container(
      height: 50,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.btnborder),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.streetAddress,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: GoogleFonts.abyssinicaSil(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 1,
            color: AppColors.btnborder,
            height: 50,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.filter_list, color: Colors.grey),
                SizedBox(width: 5),
                Text('5 Filters', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ));
}

class TutorCard extends StatelessWidget {
  final StudentTutormodel tutor;

  const TutorCard({required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.btnborder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                tutor.image,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tutor.name,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  SizedBox(width: 6),
                  Text(
                    tutor.university,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: AppColors.greycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13)),
                  ),
                  SizedBox(width: 6),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '${tutor.rating} (${tutor.reviews})',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('\$${tutor.hourlyRate}/hr',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: AppColors.btnBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 15))),
                Text(
                  '\$${tutor.oldRate}',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.greycolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
