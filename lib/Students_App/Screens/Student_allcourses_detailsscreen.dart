// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, must_be_immutable
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Controllers/student_allcoureseslist_controller.dart';
import '../../Constrant/common_widgets.dart';

final StudentAllcoureseslistController controller =
    Get.put(StudentAllcoureseslistController());

class StudentAllCoursesDetailsScreen extends StatelessWidget {
  String image;
  String title;
  String author;
  String rating;
  String tag;
  String details;

  StudentAllCoursesDetailsScreen(
      {required this.image,
      required this.title,
      required this.author,
      required this.rating,
      required this.tag,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(() {
            return IconButton(
              icon: Icon(
                controller.favoriteCourses.contains(title)
                    ? Icons.bookmark_add_rounded
                    : Icons.bookmark_add_outlined,
                color: controller.favoriteCourses.contains(title)
                    ? Colors.red
                    : Colors.grey,
              ),
              onPressed: () {
                controller.toggleFavorite(title);
              },
            );
          }),
        ],
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'About Courses',
            textSize: 16.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Obx(() {
        return title.isEmpty
            ? Center(
                child: CommonWidgets().textWidget(
                    text: "No Courses selected",
                    textSize: 16.0,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.bold),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          height: 160,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 10),
                      CommonWidgets().textWidget(
                          text: title,
                          textSize: 15.0,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.bold),
                      CommonWidgets().textWidget(
                          text: author,
                          textSize: 13.0,
                          textColor: AppColors.greycolor,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.w500),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (tag.isNotEmpty)
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: tag == 'Top Author'
                                    ? Colors.purple[100]
                                    : Colors.green[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: CommonWidgets().textWidget(
                                  text: tag,
                                  textSize: 11.0,
                                  textColor: AppColors.blackcolor,
                                  textAlign: TextAlign.start,
                                  textWeight: FontWeight.w400),
                            ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              SizedBox(width: 4),
                              CommonWidgets().textWidget(
                                  text: rating,
                                  textSize: 14.0,
                                  textColor: AppColors.greycolor,
                                  textAlign: TextAlign.start,
                                  textWeight: FontWeight.w600),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CommonWidgets().textWidget(
                          text: details,
                          textSize: 11.0,
                          textColor: AppColors.greycolor,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.w500),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = 0;
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7),
                                padding: EdgeInsets.all(10),
                                decoration: controller.selectedIndex.value == 0
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBlue)
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnborder),
                                child: CommonWidgets().textWidget(
                                    text: 'About',
                                    textSize: 14.0,
                                    textColor:
                                        controller.selectedIndex.value == 0
                                            ? AppColors.whitecolor
                                            : Colors.grey,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = 1;
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7),
                                padding: EdgeInsets.all(10),
                                decoration: controller.selectedIndex.value == 1
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBlue)
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnborder),
                                child: CommonWidgets().textWidget(
                                    text: 'Reviews',
                                    textSize: 14.0,
                                    textColor:
                                        controller.selectedIndex.value == 1
                                            ? AppColors.whitecolor
                                            : Colors.grey,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = 2;
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: controller.selectedIndex.value == 2
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnBlue)
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.btnborder),
                                child: CommonWidgets().textWidget(
                                    text: 'Author',
                                    textSize: 14.0,
                                    textColor:
                                        controller.selectedIndex.value == 2
                                            ? AppColors.whitecolor
                                            : Colors.grey,
                                    textAlign: TextAlign.center,
                                    textWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (controller.selectedIndex.value == 0)
                        About()
                      else if (controller.selectedIndex.value == 1)
                        Reviews()
                      else
                        Author()
                    ],
                  ),
                ),
              );
      }),
    );
  }
}

Widget About() {
  return Container(
    margin: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        CommonWidgets().textWidget(
            text: 'What this Course Includes',
            textSize: 15.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.w600),
        SizedBox(height: 10),
        CarouselSlider.builder(
          options: CarouselOptions(
              autoPlay: true, aspectRatio: 16 / 2.5, enlargeCenterPage: true),
          itemCount: controller.iconlist.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            final course = controller.iconlist[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.btnBluelight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: course.icon,
                  ),
                  SizedBox(width: 20),
                  CommonWidgets().textWidget(
                      text: course.name,
                      textSize: 12.0,
                      textColor: AppColors.blackcolor,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w500),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 10),
        CommonWidgets().textWidget(
            text: 'Course Materials',
            textSize: 15.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.w600),
        SizedBox(height: 10),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.coursemateriallist.length,
          itemBuilder: (context, index) {
            final course = controller.coursemateriallist[index];
            return CardItem(
                leading: course.icon, name: course.name, time: course.time);
          },
        ),
      ],
    ),
  );
}

Widget CardItem({leading, name, time}) {
  return Container(
    padding: EdgeInsets.zero,
    margin: EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greycolor)),
    child: ListTile(
      minTileHeight: 40,
      leading: leading,
      title: CommonWidgets().textWidget(
          text: name,
          textSize: 12.0,
          textmaxLine: 1,
          textoverFlow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          textWeight: FontWeight.w600),
      trailing: CommonWidgets().textWidget(
          text: time,
          textSize: 12.0,
          textColor: AppColors.btnBlue,
          textAlign: TextAlign.start,
          textWeight: FontWeight.w500),
    ),
  );
}

Widget Reviews() {
  return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          liveTutorWidget(
              name: 'Brooklyn Simmons',
              date: '16 Feb 2024',
              feedback:
                  'Insightful course with practical examples and clear explanations. Perfect for developers!'),
          liveTutorWidget(
              name: 'Ralph Edwards',
              date: '16 Feb 2024',
              feedback:
                  'I wish Muhammad Shahin was my class teacher. His teaching technic is awesome.'),
        ],
      ));
}

Widget Author() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets().textWidget(
                      text: 'Julia Anatole',
                      textSize: 15.0,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.bold),
                  CommonWidgets().textWidget(
                      text: 'Harvard Business School',
                      textSize: 13.0,
                      textColor: AppColors.greycolor,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w500),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      CommonWidgets().textWidget(
                          text: '4.5 (39)',
                          textSize: 14.0,
                          textColor: AppColors.greycolor,
                          textAlign: TextAlign.start,
                          textWeight: FontWeight.w600),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(color: AppColors.btnborder, height: 1, width: double.infinity),
      SizedBox(height: 5),
      CommonWidgets().textWidget(
          text:
              'I am Julia, an developer passionate about teaching. As the lead instructor, I have helped many students and taught at top companies worldwide.',
          textSize: 12.0,
          textColor: AppColors.greycolor,
          textAlign: TextAlign.start,
          textWeight: FontWeight.w500),
      Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.greycolor)),
        child: Column(
          children: [
            ListTile(
              minTileHeight: 0,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(255, 230, 216, 255),
                child:
                    Icon(Icons.school_outlined, color: Colors.deepPurpleAccent),
              ),
              title: CommonWidgets().textWidget(
                  text: 'Engineering',
                  textSize: 13.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w500),
              subtitle: CommonWidgets().textWidget(
                  text: 'University of Oxford',
                  textSize: 12.0,
                  textColor: AppColors.greycolor,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w500),
              trailing: CommonWidgets().textWidget(
                  text: '2020 - 2024',
                  textSize: 12.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                color: AppColors.btnborder,
                height: 1,
                width: double.infinity),
            ListTile(
              minTileHeight: 0,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(255, 225, 245, 255),
                child: Icon(Icons.school_outlined, color: Colors.lightBlue),
              ),
              title: CommonWidgets().textWidget(
                  text: 'SSC',
                  textSize: 13.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w500),
              subtitle: CommonWidgets().textWidget(
                  text: 'Hobbition High School',
                  textSize: 12.0,
                  textColor: AppColors.greycolor,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.w500),
              trailing: CommonWidgets().textWidget(
                  text: '2019',
                  textSize: 12.0,
                  textAlign: TextAlign.start,
                  textWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget liveTutorWidget({name, date, feedback}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    padding: EdgeInsets.all(11),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greycolor)),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s')),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets().textWidget(
                    text: name,
                    textSize: 14.0,
                    textAlign: TextAlign.start,
                    textWeight: FontWeight.bold),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3.5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 15,
                      glow: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(width: 15),
                    CommonWidgets().textWidget(
                        text: date,
                        textSize: 14.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w400)
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 10),
        CommonWidgets().textWidget(
            text: feedback,
            textSize: 12.0,
            textAlign: TextAlign.start,
            textColor: AppColors.greycolor,
            textWeight: FontWeight.w500),
      ],
    ),
  );
}
