import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '/constants/colors.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        centerTitle: true,
      ),
      backgroundColor: appBackGroundGrey,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Calender View',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          CalendarView(),
        ],
      ),
    );
  }
}

class CalendarView extends StatefulWidget {
  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2022, 1, 1),
      lastDay: DateTime.utc(2024, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay =
              focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onPageChanged: (focusedDay) {
        if (!isSameDay(focusedDay, DateTime.utc(2022, 12, 31)) &&
            focusedDay.isAfter(DateTime.utc(2026, 12, 31))) {
          setState(() {
            _focusedDay = DateTime.utc(2022, 12, 31);
          });
        }
      },
    );
  }
}
