// ignore_for_file: prefer_const_constructors, use_super_parameters, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/common_widgets.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Students_App/Screens/student_bookmarkpage.dart';
import 'package:learn_to_code/Students_App/Screens/student_homepage.dart';
import 'package:learn_to_code/Students_App/Screens/student_profilepage.dart';
import 'package:navbar_router/navbar_router.dart';

class StudentDashboard extends StatelessWidget {
  StudentDashboard({Key? key}) : super(key: key);

  List<NavbarItem> items = [
    NavbarItem(Icons.home_outlined, 'Home',
        selectedIcon: Icon(
          Icons.home,
          color: AppColors.softBlue,
          size: 26,
        )),
    NavbarItem(Icons.bookmark_outline, 'Bookmark',
        selectedIcon: Icon(
          Icons.bookmark,
          color: AppColors.softBlue,
          size: 26,
        )),
    NavbarItem(Icons.person_outline, 'Profile',
        selectedIcon: Icon(
          Icons.person,
          size: 26,
          color: AppColors.softBlue,
        )),
  ];

  final Map<int, Map<String, Widget>> _routes = {
    0: {
      '/': StudentHomepage(),
    },
    1: {
      '/': StudentBookmarkpage(),
    },
    2: {
      '/': StudentProfilepage(),
    },
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return CommonWidgets().willpopdialog();
          },
        );
        return shouldPop!;
      },
      child: NavbarRouter(
        errorBuilder: (context) {
          return const Center(child: Text('Error 404'));
        },
        onBackButtonPressed: (isExiting) {
          return isExiting;
        },
        destinationAnimationCurve: Curves.fastOutSlowIn,
        destinationAnimationDuration: 600,
        type: NavbarType.floating,
        decoration: NavbarDecoration(
            navbarType: BottomNavigationBarType.fixed,
            selectedLabelTextStyle: GoogleFonts.rubik(
              fontWeight: FontWeight.w500,
              color: AppColors.softBlue,
            )),
        destinations: [
          for (int i = 0; i < items.length; i++)
            DestinationRouter(
              navbarItem: items[i],
              destinations: [
                for (int j = 0; j < _routes[i]!.keys.length; j++)
                  Destination(
                    route: _routes[i]!.keys.elementAt(j),
                    widget: _routes[i]!.values.elementAt(j),
                  ),
              ],
              initialRoute: _routes[i]!.keys.first,
            ),
        ],
      ),
    );
  }
}
