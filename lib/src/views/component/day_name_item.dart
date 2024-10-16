import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/text_theme.dart';

/// A widget that displays the name of a day in the calendar.
///
/// This widget is used to display the name of a day (e.g., Monday, Tuesday) in the calendar grid.
/// It highlights weekends (Friday and Saturday) with a different color.
///
/// - [day]: The name of the day to be displayed.
/// - [index]: The index of the day in the week (0 for Sunday, 1 for Monday, etc.).
Widget dayNameItem(String day, int index) {
  return Card(
    surfaceTintColor: Colors.white,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    elevation: 0,
    child: Center(
        child: text_16_700(
            day, index == 5 || index == 6 ? redLight : calenderTextColor)),
  );
}