// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_to_code/Constrant/utilities.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_courcespage.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_homepage.dart';
import 'package:learn_to_code/Staff_App/Screens/staff_profilepage.dart';
import 'package:navbar_router/navbar_router.dart';

import '../../Constrant/common_widgets.dart';

class StaffDashboard extends StatelessWidget {
  List<NavbarItem> items = [
    NavbarItem(Icons.home_outlined, 'Home',
        selectedIcon: Icon(
          Icons.home,
          color: AppColors.softBlue,
          size: 26,
        )),
    NavbarItem(Icons.menu_book_outlined, 'Course',
        selectedIcon: Icon(
          Icons.menu_book,
          color: AppColors.softBlue,
          size: 26,
        )),
    NavbarItem(Icons.person_outline, 'Profile',
        selectedIcon: Icon(
          Icons.person,
          color: AppColors.softBlue,
          size: 26,
        )),
  ];

  final Map<int, Map<String, Widget>> _routes = {
    0: {
      '/': StaffHomepage(),
    },
    1: {
      '/': StaffCourcesPage(),
    },
    2: {
      '/': ProfileScreen(),
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
