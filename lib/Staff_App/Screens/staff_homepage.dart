// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constrant/common_widgets.dart';
import '../../Constrant/utilities.dart';
import 'staff_dashboard.dart';

class StaffHomepage extends StatelessWidget {
  const StaffHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
            text: "Staff DashBoard",
            textSize: 18.0,
            textWeight: FontWeight.w600),
      ),
      body: Column(
        children: [
          searchWidget(),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.btnborder,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              shrinkWrap: true,
              children: [
                liveTutorWidget(icon: Icons.school, name: "Hire \nTeacher"),
                liveTutorWidget(
                    icon: Icons.library_books, name: "my \n Courses"),
                liveTutorWidget(icon: Icons.class_, name: "ClassRoom"),
                liveTutorWidget(
                    icon: Icons.assignment_ind_rounded, name: "Assingment"),
                liveTutorWidget(icon: Icons.location_pin, name: "Location"),
                liveTutorWidget(
                    icon: Icons.video_collection_sharp, name: "Videos"),
                liveTutorWidget(
                    icon: Icons.menu_book_rounded, name: "Study \nMaterials"),
                liveTutorWidget(icon: Icons.headphones, name: "Chat"),
              ],
            ),
          )
        ],
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

  Widget liveTutorWidget({icon, name}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color.fromARGB(255, 230, 216, 255),
          child: Icon(
            icon,
            color: Colors.deepPurpleAccent,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CommonWidgets().textWidget(
            text: name,
            textSize: 11.0,
            textAlign: TextAlign.center,
            textmaxLine: 2,
            textoverFlow: TextOverflow.ellipsis,
            textWeight: FontWeight.w600),
      ],
    );
  }
}
