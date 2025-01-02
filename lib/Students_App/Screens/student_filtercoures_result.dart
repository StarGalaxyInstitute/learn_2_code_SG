import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/student_filtercoures_resultcontroller.dart';
import '../Helpers/student_coures.dart';

class StudentFiltercouresresult extends StatelessWidget {
  final StudentFiltercouresresultcontroller courseController =
      Get.put(StudentFiltercouresresultcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
            text: 'Filtered Results',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: searchWidget(),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: courseController.courses.length,
                itemBuilder: (context, index) {
                  final course = courseController.courses[index];
                  return CourseCard(course: course);
                },
              ),
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
                CommonWidgets().textWidget(
                    text: '5 Filters',
                    textColor: AppColors.greycolor,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.bold),
              ],
            ),
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
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 122,
            height: Get.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                course.image,
                height: 122,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets().textWidget(
                    text: course.title,
                    textSize: 12.0,
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
                  height: 5,
                ),
                Divider(),
                Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        CommonWidgets().textWidget(
                            text: course.price,
                            textSize: 13.0,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.bold),
                        SizedBox(width: 5),
                        CommonWidgets().textWidget(
                            text: course.originalPrice,
                            textSize: 12.0,
                            textdecoration: TextDecoration.lineThrough,
                            textColor: AppColors.greycolor,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.w600),
                      ],
                    ),
                    Spacer(),
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
