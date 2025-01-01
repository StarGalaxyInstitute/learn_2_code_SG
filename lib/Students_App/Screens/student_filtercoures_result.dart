import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          'Filtered Results',
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                Text('5 Filters', style: TextStyle(color: Colors.grey)),
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
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      course.image,
                      height: 122,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.visible,
                  course.title,
                  maxLines: 2,
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  course.author,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.greycolor)),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: AppColors.btnborder,
                  height: 1,
                ),
                Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          course.price,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: AppColors.blackcolor)),
                        ),
                        SizedBox(width: 5),
                        Text(
                          course.originalPrice,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppColors.greycolor)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 5),
                        Text(
                          course.rating,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.blackcolor)),
                        ),
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
                    child: Text(
                      course.tag,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.blackcolor)),
                    ),
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
