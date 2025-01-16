// ignore_for_file: prefer_const_constructors, use_super_parameters, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/student_allcoureseslist_controller.dart';
import '../Helpers/student_coures.dart';
import 'Student_allcourses_detailsscreen.dart';

class StudentAllcoursesListscreen extends StatelessWidget {
  final StudentAllcoureseslistController controller =
      Get.put(StudentAllcoureseslistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'All Courses',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: searchWidget(),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: controller.courses.length,
              itemBuilder: (context, index) {
                final course = controller.courses[index];
                return GestureDetector(
                    onTap: () {
                      controller.selectTutor(course);
                      Get.to(() => StudentAllCoursesDetailsScreen(
                          image: course.image,
                          title: course.title,
                          author: course.author,
                          rating: course.rating,
                          tag: course.tag,
                          details: course.details));
                    },
                    child: CourseCard(course: course));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: AppColors.greycolor,
                );
              },
            ),
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
                hintText: "Search a courses..",
                hintStyle: GoogleFonts.abyssinicaSil(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            width: 1,
            color: AppColors.btnborder,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.filter_list, color: Colors.grey),
          ),
        ],
      ));
}

class CourseCard extends StatelessWidget {
  final StudentCoures course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Get.height * 0.15,
            width: Get.width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                course.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets().textWidget(
                    text: course.title,
                    textSize: 12.0,
                    textoverFlow: TextOverflow.ellipsis,
                    textmaxLine: 2,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.bold),
                SizedBox(
                  height: 4,
                ),
                CommonWidgets().textWidget(
                    text: course.author,
                    textSize: 12.0,
                    textColor: AppColors.greycolor,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.w600),
                SizedBox(
                  height: 6,
                ),
                Divider(
                  height: 2,
                  color: AppColors.greycolor,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 5),
                    CommonWidgets().textWidget(
                        text: course.rating,
                        textSize: 12.0,
                        textColor: AppColors.greycolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w400),
                  ],
                ),
                if (course.tag.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 6),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: course.tag == 'Top Author'
                          ? Colors.purple[100]
                          : Colors.green[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CommonWidgets().textWidget(
                        text: course.tag,
                        textSize: 12.0,
                        textColor: AppColors.blackcolor,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w400),
                  ),
                SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
