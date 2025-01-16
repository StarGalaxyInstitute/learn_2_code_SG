// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_allcourses_Screen.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_studentslists_Page.dart';
import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import '../Controllers/staff_courses_controller.dart';
import '../Controllers/staff_home_controller.dart';
import '../Controllers/staff_shortvideos_controller.dart';
import '../Controllers/staff_teacherslist_controller.dart';
import 'staff_attendance_sheet_screen.dart';
import 'staff_popularteacherslist_screen.dart';
import 'staff_shortvideos_screen.dart';
import 'staff_teacherpersonal_details_page.dart';

class StaffHomepage extends StatelessWidget {
  final StaffHomeController controller = Get.put(StaffHomeController());
  final StaffTeacherslistController teacherController =
      Get.put(StaffTeacherslistController());
  final ShortVideosController shortVideosController =
      Get.put(ShortVideosController());
  final StaffCoursesController coursesController =
      Get.put(StaffCoursesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: CommonWidgets().textWidget(
            text: 'Home Dashboard',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchWidget(),
              SizedBox(
                height: 15,
              ),
              _buildCategoryGrid(),
              _buildSectionTitle(
                "Popular Teachers",
                () {
                  Get.to(StaffPopularteacherslistScreen());
                },
              ),
              _buildPopularTeachers(),
              _buildSectionTitle(
                "Short Videos",
                () {
                  Get.to(StaffShortvideosScreen());
                },
              ),
              _buildShortVideos(),
              _buildSectionTitle(
                "Courses",
                () {
                  Get.to(StaffAllcoursesScreen());
                },
              ),
              _buildCourses(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return Obx(() => GridView.builder(
          itemCount: controller.categories.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return GestureDetector(
              onTap: () => _navigateToScreen(category["title"].toString()),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child:
                        Icon(category["icon"] as IconData, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  CommonWidgets().textWidget(
                      text: category["title"].toString(),
                      textSize: 11.0,
                      textmaxLine: 2,
                      textAlign: TextAlign.start,
                      textWeight: FontWeight.w600),
                ],
              ),
            );
          },
        ));
  }

  void _navigateToScreen(String title) {
    switch (title) {
      case "Students":
        Get.to(StaffStudentslistsPage());
        break;
      case "Course list":
        break;
      case "Nearby":
        break;
      case "Progress":
        break;
      case "Assignment":
        break;
      case "Payments":
        break;
      case "Attendance":
        Get.to(StaffAttendanceSheetScreen());
        break;
      case "Support":
        break;
      default:
        print("Invalid category");
    }
  }

  Widget _buildSectionTitle(title, callback) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonWidgets().textWidget(
              text: title,
              textSize: 17.0,
              textAlign: TextAlign.start,
              textWeight: FontWeight.bold),
          TextButton(
            onPressed: callback,
            child: CommonWidgets().textWidget(
                text: 'See All',
                textSize: 13.0,
                textColor: AppColors.btnBlue,
                textWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularTeachers() {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final teacher = teacherController.teacherList[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.btnborder),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(bottom: 7),
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
  }

  Widget _buildShortVideos() {
    return SizedBox(
      height: 145,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          final video = shortVideosController.videos[index];
          return GestureDetector(
            onTap: () {
              shortVideosController.selectIndex(video);
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(video.videoThumbnail,
                      width: 120, height: 100, fit: BoxFit.cover),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CommonWidgets().textWidget(
                        text: video.user,
                        textSize: 11.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourses() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final course = coursesController.courses[index];
          return Container(
            margin: EdgeInsets.only(right: 10),
            width: 155,
            decoration: BoxDecoration(
                color: course.color, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                    height: 100,
                    margin: EdgeInsets.all(1),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        CommonWidgets().textWidget(
                            text: course.title,
                            textSize: 12.0,
                            textmaxLine: 2,
                            textColor: AppColors.blackcolor,
                            textoverFlow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.bold),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            SizedBox(
                              width: 90,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidgets().textWidget(
                                      text: course.classes,
                                      textSize: 9.0,
                                      textmaxLine: 1,
                                      textColor: AppColors.greycolor,
                                      textoverFlow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      textWeight: FontWeight.w600),
                                  CommonWidgets().textWidget(
                                      text: course.duration,
                                      textSize: 9.0,
                                      textmaxLine: 1,
                                      textColor: AppColors.greycolor,
                                      textoverFlow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      textWeight: FontWeight.w600),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: CircleAvatar(child: Icon(course.icon)),
                            )
                          ],
                        )
                      ],
                    )),
                Container(
                  height: 48,
                  width: double.infinity,
                  color: AppColors.whitecolor,
                  child: Center(
                    child: CommonWidgets().textWidget(
                        text: course.details,
                        textSize: 11.0,
                        textmaxLine: 2,
                        textColor: AppColors.blackcolor,
                        textoverFlow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        textWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget searchWidget() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.btnborder),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: TextFormField(
                onChanged: (value) => controller.searchText.value = value,
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
            Container(
              width: 1,
              color: AppColors.btnborder,
              height: 50,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                // Get.to(() => StudentFiltertutorScreen());
              },
              child: Icon(
                Icons.filter_list_sharp,
              ),
            )),
          ],
        ));
  }
}
