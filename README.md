# Easy Event Calendar

![Package][pubdev-package]
![Likes][pubdev-likes]
![Popularity][pubdev-popularity]
![Points][pubdev-points]

![banner][banner]


## Getting started

### Add dependency with `flutter pub add` command

```shell
flutter pub add easy_event_calendar
```

### **Or** Add below line to `pubspec.yaml`

```yaml
dependencies:
  ...
  easy_event_calendar: any  # or special version

```


# Usage

```Dart
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
      home: Scaffold(
          body:
          /// A widget that displays an event calendar.
          ///
          /// This widget uses the GetX package for state management and displays a calendar
          /// with event dates highlighted. It allows navigation between months and displays
          /// the days of the week and dates in a grid format.
          
          EasyEventCalendar(
            // List of calendar events to be displayed on the calendar.
            eventDates: eventDates,
            // The color of the calendar.
            calenderColor: Colors.brown,
            // The color of the events on the calendar.
            eventColor: Colors.purple,
          )),
    ),
  );
}

```