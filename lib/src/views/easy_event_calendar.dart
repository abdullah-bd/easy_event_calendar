import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/calendar_event.dart';
import '../theme/colors.dart';
import '../theme/text_theme.dart';
import '../controllers/custom_calendar_controller.dart';
import 'component/date_item.dart';
import 'component/day_name_item.dart';

/// A widget that displays an event calendar.
///
/// This widget uses the GetX package for state management and displays a calendar
/// with event dates highlighted. It allows navigation between months and displays
/// the days of the week and dates in a grid format.
class EasyEventCalendar extends GetView<CustomCalenderController> {
  /// A list of events to be displayed on the calendar.
  final List<CalendarEvent> eventDates;

  /// The color used to highlight event dates.
  final MaterialColor eventColor;

  /// The color used for the calendar background.
  final MaterialColor calenderColor;

  /// Creates an [EasyEventCalendar] widget.
  ///
  /// The [eventDates] parameter is required and specifies the list of events to be displayed.
  /// The [eventColor] and [calenderColor] parameters are optional and default to blue and green, respectively.
  const EasyEventCalendar({
    super.key,
    required this.eventDates,
    this.eventColor = Colors.blue,
    this.calenderColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CustomCalenderController());
    controller.eventDates = eventDates;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.decrease(controller.selectedMonth.value);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: primaryDarkColor,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        IconButton(
                          onPressed: () {
                            controller.increaseMonth(controller.selectedMonth.value);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: primaryDarkColor,
                          ),
                        ),
                      ],
                    ),
                    Obx(() => text_20_700(controller.selectedMonth.value, primaryDarkColor))
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                  ),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return dayNameItem(controller.list[index].dayName, index);
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                Obx(
                      () => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: 40 / 44,
                    ),
                    itemCount: controller.calenderMonth.length,
                    itemBuilder: (context, index) {
                      return controller.calenderMonth[index].date != -1
                          ? dateItem(
                        controller.calenderMonth[index],
                        controller,
                        controller.selectedIndex,
                        index,
                            (String value) {
                          if (kDebugMode) {
                            print("date value: ${value.toString()}");
                          }
                        },
                      )
                          : dateItemContainer();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
    ),
  );
}

/// A widget that displays a chip with a title and an optional icon.
///
/// The chip can be selected or unselected, and it triggers the [onClick] callback when tapped.
///
/// - [title]: The text to be displayed on the chip.
/// - [isSelected]: Whether the chip is selected.
/// - [onClick]: The callback to be triggered when the chip is tapped.
/// - [isIcon]: Whether to display an icon next to the title.
Widget chips(String title, bool isSelected, Function() onClick, [bool isIcon = false]) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(
      decoration: BoxDecoration(
        color: primaryDarkColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Container(
          height: 34,
          decoration: BoxDecoration(
            color: isSelected == true ? primaryDarkColor : secondaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                isIcon == true
                    ? const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                )
                    : Container(),
                text_14_400(title, isSelected == true ? secondaryColor : primaryDarkColor),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}