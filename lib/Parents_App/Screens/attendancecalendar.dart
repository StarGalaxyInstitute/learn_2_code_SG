import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceCalendar extends StatefulWidget {
  const AttendanceCalendar({Key? key}) : super(key: key);

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, String> attendanceData =
      {}; // Store attendance data (Present/Absent)

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _generateAttendanceData(); // Generate random attendance data
  }

  /// Generates random attendance data for the year 2025
  void _generateAttendanceData() {
    final random = Random();
    for (int month = 1; month <= 12; month++) {
      for (int day = 1; day <= DateTime(2025, month + 1, 0).day; day++) {
        DateTime date = DateTime(2025, month, day);
        String status = random.nextBool() ? 'Present' : 'Absent';
        attendanceData[date] = status; // Save status in the map
      }
    }
  }

  /// Determines the background color based on the attendance status and day
  Color _getBackgroundColor(DateTime date) {
    bool isSunday = date.weekday == DateTime.sunday;
    String? status = attendanceData[date];

    if (isSunday) {
      return Colors.green; // Sundays are green
    } else if (status == 'Absent') {
      return Colors.red; // Absent days are red
    } else if (status == 'Present') {
      return Colors.blue; // Present days are blue
    } else {
      return Colors.white; // Default background color
    }
  }

  /// Handles day selection
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance Calendar')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            onDaySelected: _onDaySelected,
            availableCalendarFormats: {
              CalendarFormat.month: 'Month',
            },
            calendarBuilders: CalendarBuilders(
              /// Custom builder for day cells
              defaultBuilder: (context, date, _) {
                Color backgroundColor = _getBackgroundColor(date);
                bool isSunday = date.weekday == DateTime.sunday;

                return Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: isSunday || backgroundColor != Colors.white
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: attendanceData.entries.map((entry) {
                String date = DateFormat('yyyy-MM-dd').format(entry.key);
                String status = entry.value;
                Color statusColor =
                    status == 'Absent' ? Colors.red : Colors.blue;

                return ListTile(
                  title: Text(date),
                  trailing: Text(
                    status,
                    style: TextStyle(color: statusColor),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
