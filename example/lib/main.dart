
import 'package:easy_event_calendar/easy_event_calendar.dart';
import 'package:flutter/material.dart';


void main() {
  List<CalendarEvent> eventDates = [
    CalendarEvent(date: DateTime(2024, 10, 05), eventCount: 2),
    CalendarEvent(date: DateTime(2024, 10, 5), eventCount: 2),
    CalendarEvent(date: DateTime(2024, 10, 02), eventCount: 3),
    CalendarEvent(date: DateTime(2024, 11, 26), eventCount: 1),
    CalendarEvent(date: DateTime(2024, 12, 14), eventCount:2 ),
    CalendarEvent(date: DateTime(2024, 12, 14), eventCount: 3),
    CalendarEvent(date: DateTime(2024, 3, 8), eventCount:4),
  ];
  runApp(
    MaterialApp(
      home: Scaffold(body: EasyEventCalendar(eventDates: eventDates,calenderColor: Colors.red,eventColor: Colors.red,)),
    ),
  );
}
