import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

/// A utility class for handling date and time operations.
class DateTimeUtils {
  /// Date format for "MMM yyyy".
  static const String mmmYyyyString = "MMM yyyy";

  /// Date format for "MM/yyyy".
  static const String mmYyyyNumber = "MM/yyyy";

  /// Date format for "dd MMM yyyy".
  static const String ddMmmYyyy = "dd MMM yyyy";

  /// Date format for "yyyy-MM-dd".
  static const String ymd = "yyyy-MM-dd";

  /// Date format for "dd/MM/yyyy".
  static const String ddMmYear = "dd/MM/yyyy";

  /// Date format for "dd-MM-yyyy".
  static const String ddMmYyyy = "dd-MM-yyyy";

  /// Time format for "HH:mm:ss".
  static const String hhMmSs = "HH:mm:ss";

  /// Time format for "hh:mm a".
  static const String hhMma = "hh:mm a";

  /// Returns the current date and time as a string in the specified [format].
  ///
  /// - [format]: The format in which to return the current date and time.
  /// - Returns: The current date and time as a formatted string.
  static String getCurrentDateTime(String format) {
    var now = DateTime.now();
    var formatter = DateFormat(format);
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  /// Returns the given [date] as a string in the "yyyy-MM-dd" format.
  ///
  /// - [date]: The date to format.
  /// - Returns: The formatted date string.
  static String getStringOfDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Changes the format of the given [date] from [currentFormat] to [newFormat].
  ///
  /// - [currentFormat]: The current format of the date.
  /// - [newFormat]: The new format to convert the date to.
  /// - [date]: The date string to reformat.
  /// - Returns: The reformatted date string, or null if an error occurs.
  static String? changeDateFormat(
      String currentFormat, String newFormat, String date) {
    try {
      var datePickerFormat = DateFormat(currentFormat, 'en_US');
      var myFormat = DateFormat(newFormat);

      DateTime dateFromUser = datePickerFormat.parse(date);
      return myFormat.format(dateFromUser);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  /// Converts the given [dateStr] to a [DateTime] object using the specified [format].
  ///
  /// - [format]: The format of the date string.
  /// - [dateStr]: The date string to convert.
  /// - Returns: The parsed [DateTime] object.
  static DateTime convertStringToDate(String format, String dateStr) {
    final formatter = DateFormat(format);
    return formatter.parse(dateStr);
  }

  /// Changes the format of the given [date] from "yyyy-MM-dd" to "dd MMM yyyy".
  ///
  /// - [date]: The date string to reformat.
  /// - Returns: The reformatted date string, or null if an error occurs.
  static String? changeDateToStringFormat(String date) {
    return changeDateFormat(ymd, ddMmmYyyy, date);
  }

  /// Changes the format of the given [time] from "HH:mm:ss" to "hh:mm a".
  ///
  /// - [time]: The time string to reformat.
  /// - Returns: The reformatted time string, or null if an error occurs.
  static String? changeTime24To12Format(String time) {
    return changeDateFormat(hhMmSs, hhMma, time);
  }

  /// Determines if the status can be changed based on the given [actualDateString].
  ///
  /// - [actualDateString]: The actual date string to compare.
  /// - Returns: True if the status can be changed, false otherwise.
  static bool isStatusChangeable(String actualDateString) {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Subtract two days from the current date
    DateTime twoDaysAgo = currentDate.subtract(const Duration(days: 2));

    DateTime actualDate = DateTime.parse(actualDateString);

    // Format the date if needed
    //String formattedDate = DateFormat('yyyy-MM-dd').format(twoDaysAgo);

    if (actualDate.compareTo(twoDaysAgo) <= 0) {
      return false;
    }
    return true;
  }
}