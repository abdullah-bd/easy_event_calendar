import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';
import '../../theme/text_theme.dart';
import '../../controllers/custom_calendar_controller.dart';
import '../../data/month_date.dart';

/// A widget that displays a date item in the calendar.
///
/// This widget highlights the selected date and triggers the [onClick] callback
/// when the date is tapped. It also displays a dot for each event on the date.
///
/// - [monthDate]: The date information for the month.
/// - [controller]: The controller for managing calendar state.
/// - [selectedIndex]: The index of the currently selected date.
/// - [index]: The index of this date item in the calendar grid.
/// - [onClick]: The callback to be triggered when the date is tapped.
Widget dateItem(MonthDate monthDate, CustomCalenderController controller,
    RxInt selectedIndex, int index, Function(String val) onClick) {
  return Obx(() => GestureDetector(
    onTap: () {
      selectedIndex.value =
      selectedIndex.value != monthDate.date ? monthDate.date : -1;
      onClick(monthDate.actualDate);
    },
    child: Card(
      color: selectedIndex.value == monthDate.date
          ? primaryDarkColor
          : calenderDateBackground,
      surfaceTintColor: calenderDateBackground,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
              width: monthDate.isCurrent ? 1 : 0,
              color: monthDate.isCurrent
                  ? primaryDarkColor
                  : calenderDateBackground)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                text_16_400(
                    monthDate.date.toString(),
                    selectedIndex.value == monthDate.date
                        ? Colors.white
                        : controller.isFridayOrSaturday(monthDate.actualDate)
                        ? redLight
                        : calenderTextColor),
                const SizedBox(
                  height: 4,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: controller.isHasEventPosition(monthDate.actualDate) == -1
                      ? 0
                      : controller.isHasEventPosition(monthDate.actualDate),
                  itemBuilder: (context, index) {
                    return dot(Colors.blue);
                  },
                )
              ],
            )),
      ),
    ),
  ));
}

/// A widget that displays an empty date item container.
///
/// This widget is used to fill empty spaces in the calendar grid.
Widget dateItemContainer() {
  return Card(
    color: calenderDateBackground,
    surfaceTintColor: calenderDateBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(child: text_16_400("")),
    ),
  );
}

/// A widget that displays a dot.
///
/// This widget is used to represent an event on a date.
///
/// - [color]: The color of the dot.
Widget dot(Color color) {
  return Container(
    padding: const EdgeInsets.all(2),
    height: 8,
    width: 8,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}