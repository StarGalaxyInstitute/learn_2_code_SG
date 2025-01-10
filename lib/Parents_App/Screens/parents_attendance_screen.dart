// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

import '../../Constrant/common_widgets.dart';

class ParentsAttendanceScreen extends StatefulWidget {
  const ParentsAttendanceScreen({super.key});

  @override
  State<ParentsAttendanceScreen> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<ParentsAttendanceScreen> {
  List<DateTime> presentDates = [];
  List<DateTime> absentDates = [];

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: <DateTime, List<Event>>{},
  );

  late CalendarCarousel<Event> _calendarCarouselNoHeader;

  late double cHeight;

  void updateDates() {
    DateTime currentDate = DateTime.now();
    int currentYear = currentDate.year;
    int currentMonth = currentDate.month;
    List<int> presentDayNumbers = [1, 4, 5, 6, 9];
    List<int> absentDayNumbers = [2, 3, 7, 8];
    presentDates = presentDayNumbers.map((day) {
      return DateTime(currentYear, currentMonth, day);
    }).toList();
    absentDates = absentDayNumbers.map((day) {
      return DateTime(currentYear, currentMonth, day);
    }).toList();
  }

  void markTheDates() {
    /// This function is used to mark the added dates,
    for (int index = 0; index < presentDates.length; index++) {
      _markedDateMap.add(
        presentDates[index],
        Event(
          date: presentDates[index],
          title: 'Present',
          icon: _presentIcon(presentDates[index].day.toString()),
        ),
      );
    }

    for (int index = 0; index < absentDates.length; index++) {
      _markedDateMap.add(
        absentDates[index],
        Event(
          date: absentDates[index],
          title: 'Absent',
          icon: _absentIcon(absentDates[index].day.toString()),
        ),
      );
    }
  }

  void initializeCalendarCarousal() {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.25,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      weekFormat: true,
      todayButtonColor: Colors.blue.shade200,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updateDates();
    markTheDates();
  }

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    initializeCalendarCarousal();

    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
          text: "Calendar",
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _calendarCarouselNoHeader,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  markerRepresent(Colors.red, "Absent"),
                  markerRepresent(Colors.green, "Present"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _presentIcon(String day) => CircleAvatar(
        backgroundColor: Colors.green,
        child: CommonWidgets().textWidget(
          text: day,
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
      );

  static Widget _absentIcon(String day) => CircleAvatar(
        backgroundColor: Colors.red,
        child: CommonWidgets().textWidget(
          text: day,
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
      );

  Widget markerRepresent(Color color, String data) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: cHeight * 0.022,
        ),
        SizedBox(width: 5),
        CommonWidgets().textWidget(
          text: data,
          textWeight: FontWeight.bold,
          textSize: 15.0,
        ),
      ],
    );
  }
}
