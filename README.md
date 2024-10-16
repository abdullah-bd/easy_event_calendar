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
      home: Scaffold(body: EasyEventCalendar(eventDates: eventDates)),
    ),
  );
}

```