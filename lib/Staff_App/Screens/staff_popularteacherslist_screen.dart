// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_teacherpersonal_details_page.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/staff_teacherslist_controller.dart';

class StaffPopularteacherslistScreen extends StatelessWidget {
  final StaffTeacherslistController teacherController =
      Get.put(StaffTeacherslistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'Popular Teachers',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: teacherController.teacherList.length,
          itemBuilder: (context, index) {
            final teacher = teacherController.teacherList[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.btnborder),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s"),
                ),
                title: CommonWidgets().textWidget(
                    text: teacher.name,
                    textSize: 14.0,
                    textmaxLine: 1,
                    textoverFlow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.bold),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidgets().textWidget(
                        text: teacher.subject,
                        textSize: 12.0,
                        textmaxLine: 1,
                        textoverFlow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    CommonWidgets().textWidget(
                        text: teacher.location,
                        textSize: 10.0,
                        textmaxLine: 1,
                        textoverFlow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w400),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 12,
                        glow: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ]),
                    const SizedBox(height: 7),
                    GestureDetector(
                      onTap: () {
                        teacherController.selectIndex(teacher);
                        Get.to(StaffTeacherpersonalDetailsPage(
                          name: teacher.name,
                          subject: teacher.subject,
                          location: teacher.location,
                          subjects: teacher.subjects,
                          about: teacher.about,
                          graduation: teacher.graduation,
                          rating: teacher.rating,
                          reviews: teacher.reviews,
                          salary: teacher.salary,
                        ));
                      },
                      child: Container(
                        width: 60,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.btnBlue),
                        child: Center(
                          child: CommonWidgets().textWidget(
                              text: 'Hire',
                              textColor: AppColors.whitecolor,
                              textAlign: TextAlign.start,
                              textSize: 12.0,
                              textWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
