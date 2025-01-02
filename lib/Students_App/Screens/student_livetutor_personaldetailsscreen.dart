import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import '../../Constrant/common_widgets.dart';
import '../Controllers/student_toplivetutor_controller.dart';

class StudentLiveTutorPersonalDetailsScreen extends StatelessWidget {
  final StudentToplivetutorController tutorController =
      Get.put(StudentToplivetutorController());

  @override
  Widget build(BuildContext context) {
    final tutor = tutorController.selectedTutor.value;

    if (tutor == null) {
      return Scaffold(
        body: Center(
          child: CommonWidgets().textWidget(
              text: "No tutor selected",
              textSize: 16.0,
              textColor: AppColors.blackcolor,
              textAlign: TextAlign.start,
              textWeight: FontWeight.bold),
        ),
      );
    }
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.btnBlue,
        ),
        child: Center(
          child: CommonWidgets().textWidget(
              text: "Book Me",
              textSize: 16.0,
              textColor: AppColors.whitecolor,
              textAlign: TextAlign.center,
              textWeight: FontWeight.bold),
        ),
      ),
      appBar: AppBar(
        title: CommonWidgets().textWidget(
            text: tutor.name,
            textSize: 16.0,
            textColor: AppColors.blackcolor,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s'), // Replace with avatar image URL
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidgets().textWidget(
                            text: tutor.name,
                            textSize: 15.0,
                            textColor: AppColors.blackcolor,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.bold),
                        CommonWidgets().textWidget(
                            text: tutor.university,
                            textSize: 13.0,
                            textColor: AppColors.greycolor,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.w500),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            CommonWidgets().textWidget(
                                text: '${tutor.rating} (${tutor.reviewscount})',
                                textSize: 14.0,
                                textColor: AppColors.greycolor,
                                textAlign: TextAlign.start,
                                textWeight: FontWeight.w600),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CommonWidgets().textWidget(
                          text: '\$${tutor.hourlyRate}/hr',
                          textSize: 13.0,
                          textColor: AppColors.btnBlue,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.bold),
                      CommonWidgets().textWidget(
                          text: '\$${tutor.discountedRate}',
                          textSize: 11.0,
                          textColor: AppColors.greycolor,
                          textdecoration: TextDecoration.lineThrough,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.w500),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.btnborder,
              height: 1,
              width: double.infinity,
            ),
            SizedBox(
              height: 5,
            ),
            CommonWidgets().textWidget(
                text: tutor.details,
                textSize: 12.0,
                textColor: AppColors.greycolor,
                textAlign: TextAlign.start,
                textWeight: FontWeight.w500),

            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.whitecolor,
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color.fromARGB(255, 230, 216, 255),
                      child: Icon(
                        Icons.school_outlined,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    title: CommonWidgets().textWidget(
                        text: tutor.collagedegree,
                        textSize: 13.0,
                        textColor: AppColors.blackcolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                    subtitle: CommonWidgets().textWidget(
                        text: tutor.schooldegree,
                        textSize: 12.0,
                        textColor: AppColors.greycolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                    trailing: CommonWidgets().textWidget(
                        text: tutor.collageyear,
                        textSize: 12.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                  ),
                  Container(
                    color: AppColors.btnborder,
                    height: 1,
                    width: double.infinity,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color.fromARGB(255, 225, 245, 255),
                      child: Icon(
                        Icons.school_outlined,
                        color: Colors.lightBlue,
                      ),
                    ),
                    title: CommonWidgets().textWidget(
                        text: tutor.collagedegree,
                        textSize: 13.0,
                        textColor: AppColors.blackcolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                    subtitle: CommonWidgets().textWidget(
                        text: tutor.schooldegree,
                        textSize: 12.0,
                        textColor: AppColors.greycolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                    trailing: CommonWidgets().textWidget(
                        text: tutor.collageyear,
                        textSize: 12.0,
                        textColor: AppColors.blackcolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Reviews
            Expanded(
              child: ListView.builder(
                itemCount: tutor.reviews.length,
                itemBuilder: (context, index) {
                  final review = tutor.reviews[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s"),
                    ),
                    title: CommonWidgets().textWidget(
                        text: review["name"],
                        textSize: 16.0,
                        textColor: AppColors.blackcolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                    subtitle: CommonWidgets().textWidget(
                        text: review["feedback"],
                        textSize: 16.0,
                        textColor: AppColors.blackcolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                    trailing: CommonWidgets().textWidget(
                        text: review["date"],
                        textSize: 15.0,
                        textColor: AppColors.blackcolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
