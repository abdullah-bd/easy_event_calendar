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
          body: EasyEventCalendar(
            // List of calendar events to be displayed on the calendar.
            eventDates: eventDates,
            // The callback to be triggered when a date is tapped.
            onDateClick: (DateTime dateTime) {
              if (kDebugMode) {
                print("date value: ${dateTime.toString()}");
              }
            },
            //or
            // onDateClick: onClick,

            // The color of the calendar.
            calenderColor: Colors.brown,
            // The color of the events on the calendar.
            eventColor: Colors.purple,
          )),
    ),
  );

  onClick(DateTime dateTime) {
    if (kDebugMode) {
      print("date value: ${dateTime.toString()}");
    }
  }
}

```


[pubdev-package]: https://img.shields.io/pub/v/easy_event_calendar.svg
[pubdev-likes]: https://img.shields.io/pub/likes/easy_event_calendar?logo=dart
[pubdev-popularity]: https://img.shields.io/pub/popularity/easy_event_calendar?logo=dart
[pubdev-points]: https://img.shields.io/pub/points/easy_event_calendar?logo=dart
[banner]: https://github.com/abdullah-bd/easy_event_calendar/blob/3bd377cfc1a8ab2d4b5553ce334df164417b8a04/screenshots/shot1.png?raw=true