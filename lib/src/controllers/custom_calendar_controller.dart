import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:get/get.dart';

import '../data/calendar_event.dart';
import '../data/day_name.dart';
import '../data/month_date.dart';
import '../theme/colors.dart';
import '../utils/date_time_utils.dart';

/// Controller for managing the custom calendar.
///
/// This controller handles the state and logic for displaying a custom calendar,
/// including the list of day names, selected month, and events.
class CustomCalenderController extends GetxController {
  /// List of day names in the week.
  RxList list = <DayName>[].obs;

  /// Number of days in the selected month.
  RxInt dateList = 0.obs;

  /// Currently selected month in "MMM yyyy" format.
  RxString selectedMonth = "".obs;

  /// Current month in "MMM yyyy" format.
  RxString currentMonth = "".obs;

  /// List of dates in the selected month.
  RxList calenderMonth = <MonthDate>[].obs;

  /// Start day of the selected month (0 for Sunday, 1 for Monday, etc.).
  RxInt startDayOfMonth = 0.obs;

  /// Index of the currently selected date.
  RxInt selectedIndex = 1.obs;

  /// Whether a month is selected.
  RxBool isMonthSelected = true.obs;

  /// List of events to be displayed on the calendar.
  List<CalendarEvent> eventDates = [];

  MaterialColor eventColor = Colors.blue;

  MaterialColor calenderColor = Colors.red;

  @override
  void onInit() {
    super.onInit();
    calender();
  }

  /// Initializes the calendar by setting the day names, selected month, and generating the calendar.
  void calender() {
    showDayName();
    selectedIndex.value = int.parse(DateTimeUtils.getCurrentDateTime("dd"));
    selectedMonth.value =
        DateTimeUtils.getCurrentDateTime(DateTimeUtils.mmmYyyyString);
    currentMonth.value =
        DateTimeUtils.getCurrentDateTime(DateTimeUtils.mmmYyyyString);
    getStartDayOfMonth(int.parse(DateTimeUtils.getCurrentDateTime("yyyy")),
        int.parse(DateTimeUtils.getCurrentDateTime("MM")));
    generateCalendar();
  }

  /// Adds the names of the days of the week to the list.
  void showDayName() {
    list.add(DayName("Sun"));
    list.add(DayName("Mon"));
    list.add(DayName("Tue"));
    list.add(DayName("Wed"));
    list.add(DayName("Thu"));
    list.add(DayName("Fri"));
    list.add(DayName("Sat"));
  }

  /// Checks if the given day is a weekend (Friday or Saturday).
  ///
  /// - [day]: The name of the day to check.
  /// - Returns: True if the day is a weekend, false otherwise.
  bool isWeekendDay(String day) {
    return list[5] == day || list[6] == day;
  }

  /// Gets the position of the event for the given date.
  ///
  /// - [actualDate]: The date to check for events.
  /// - Returns: The position of the event if found, -1 otherwise.
  int isHasEventPosition(String actualDate) {
    for (int i = 0; i < eventDates.length; i++) {
      var date = eventDates[i];
      if (actualDate == DateTimeUtils.getStringOfDate(date.date)) {
        return date.eventCount;
      }
    }
    return -1;
  }

  /// Gets the color for the event based on the session event data.
  ///
  /// - [sessionEventData]: The session event data.
  /// - Returns: The color for the event.
  Color getEventColor(int? sessionEventData) {
    if (sessionEventData != null) {
      if (sessionEventData == 3) {
        return yellow;
      }
      return redLight;
    }

    if (sessionEventData == 3) {
      return yellow;
    }
    if (sessionEventData == 1) {
      return blueLight;
    } else if (sessionEventData == 2) {
      return lightGreenColor;
    }

    return blueLight;
  }

  /// Gets the start day of the month for the given year and month.
  ///
  /// - [year]: The year of the month.
  /// - [month]: The month to get the start day for.
  void getStartDayOfMonth(int year, int month) {
    var cal = DateTime.utc(year, month, 1);
    final monthValue = cal.month;
    final yearValue = cal.year;
    final length = DateTime.utc(yearValue, monthValue + 1, 0).day;
    if (cal.weekday == 7) {
      startDayOfMonth.value = 0;
    } else {
      startDayOfMonth.value = cal.weekday;
    }

    if (kDebugMode) {
      print("start day of month ${list[startDayOfMonth.value].dayName}");
    }
    dateList.value = length;
    setSelectedTopMonthYear(year, month);
    if (kDebugMode) {
      print("month length${dateList.value}");
    }
  }

  /// Sets the selected month and year in "MMM yyyy" format.
  ///
  /// - [year]: The year to set.
  /// - [month]: The month to set.
  void setSelectedTopMonthYear(int year, int month) {
    selectedMonth.value = DateTimeUtils.changeDateFormat(
      DateTimeUtils.mmYyyyNumber,
      DateTimeUtils.mmmYyyyString,
      '$month/$year',
    )!;
  }

  /// Generates the calendar for the selected month.
  void generateCalendar() {
    List<MonthDate> list = [];
    int? gridSize = startDayOfMonth.value + dateList.value;
    for (int i = 0; i < gridSize; i++) {
      if (i < startDayOfMonth.value) {
        list.add(MonthDate(
            date: -1, actualDate: '', isCurrent: false, isHasEvent: false));
      } else {
        int date = i - (startDayOfMonth.value - 1);
        String actualDate = DateTimeUtils.changeDateFormat(
            DateTimeUtils.ddMmmYyyy,
            DateTimeUtils.ymd,
            '$date ${selectedMonth.value}')!;
        bool isHasEvent = false;
        list.add(
          MonthDate(
            date: date,
            actualDate: actualDate,
            isCurrent: actualDate ==
                DateTimeUtils.getCurrentDateTime(DateTimeUtils.ymd),
            isHasEvent: isHasEvent,
          ),
        );
      }
    }
    calenderMonth.value = list;
    for (int i = 0; i < calenderMonth.length; i++) {
      if (kDebugMode) {
        print("Month data : ${calenderMonth[i].toString()}");
      }
    }
  }

  /// Gets the position of the current week in the list of weeks.
  ///
  /// - [weeks]: The list of weeks.
  /// - Returns: The position of the current week, or -1 if not found.
  int getCurrentWeekPosition(List<List<MonthDate>> weeks) {
    for (int i = 0; i < weeks.length; i++) {
      for (int j = 0; j < weeks[i].length; j++) {
        if (weeks[i][j].actualDate ==
            DateTimeUtils.getCurrentDateTime(DateTimeUtils.ymd)) {
          return i + 1; // Week position is 1-based index
        }
      }
    }

    return -1; // If current week not found
  }

  /// Checks if the given date is a Friday or Saturday.
  ///
  /// - [dateStr]: The date string to check.
  /// - Returns: True if the date is a Friday or Saturday, false otherwise.
  bool isFridayOrSaturday(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    return date.weekday == DateTime.friday || date.weekday == DateTime.saturday;
  }

  /// Gets the selected month in "MM" format.
  ///
  /// - Returns: The selected month in "MM" format.
  String getSelectedMonth() {
    return DateTimeUtils.changeDateFormat(
      DateTimeUtils.mmmYyyyString,
      'MM',
      selectedMonth.value,
    )!;
  }

  /// Gets the selected year in "yyyy" format.
  ///
  /// - Returns: The selected year in "yyyy" format.
  String getSelectedYear() {
    return DateTimeUtils.changeDateFormat(
      DateTimeUtils.mmmYyyyString,
      'yyyy',
      selectedMonth.value,
    )!;
  }

  /// Increases the selected month by one.
  ///
  /// - [date]: The current date in "MMM yyyy" format.
  void increaseMonth(String date) {
    selectedIndex.value = -1;

    int selectedMonth = int.parse(DateTimeUtils.changeDateFormat(
      DateTimeUtils.mmmYyyyString,
      'MM',
      date,
    )!);

    int selectedYear = int.parse(DateTimeUtils.changeDateFormat(
      DateTimeUtils.mmmYyyyString,
      'yyyy',
      date,
    )!);

    DateTime newDate = DateTime(selectedYear, selectedMonth + 1, 1);
    int month = newDate.month;
    int year = newDate.year;

    getStartDayOfMonth(year, month);
    generateCalendar();
  }

  /// Decreases the selected month by one.
  ///
  /// - [date]: The current date in "MMM yyyy" format.
  void decrease(String date) {
    selectedIndex.value = -1;

    int selectedMonth = int.parse(DateTimeUtils.changeDateFormat(
      DateTimeUtils.mmmYyyyString,
      'MM',
      date,
    )!);

    int selectedYear = int.parse(DateTimeUtils.changeDateFormat(
      DateTimeUtils.mmmYyyyString,
      'yyyy',
      date,
    )!);

    DateTime newDate = DateTime(selectedYear, selectedMonth - 1, 1);
    int month = newDate.month;
    int year = newDate.year;

    getStartDayOfMonth(year, month);
    generateCalendar();
  }
}
