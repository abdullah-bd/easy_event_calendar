import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

/// A widget that displays text with a font size of 18 and weight of 800.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_18_800(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: color));
}

/// A widget that displays text with a font size of 24 and weight of 800.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_24_800(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: color));
}

/// A widget that displays text with a font size of 16 and weight of 700.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_16_700(String? value, [Color color = textColor]) {
  return Text(
    "$value",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: color),
    textAlign: TextAlign.start,
  );
}

/// A widget that displays text with a font size of 20 and weight of 700.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_20_700(String? value, [Color color = textColor]) {
  return Text(
    "$value",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color),
    textAlign: TextAlign.start,
  );
}

/// A widget that displays text with a font size of 12 and weight of 700.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_12_700(String? value, [Color color = textColor]) {
  return Text(
    "$value",
    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color),
    textAlign: TextAlign.start,
  );
}

/// A widget that displays text with a font size of 16 and weight of 500.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_16_500(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color));
}

/// A widget that displays text with a font size of 16 and weight of 400.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
/// - [textAlign]: The alignment of the text. Defaults to [TextAlign.start].
Widget text_16_400(String? value,
    [Color color = textColor, TextAlign textAlign = TextAlign.start]) {
  return Text(
    "$value",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color),
    textAlign: textAlign,
  );
}

/// A widget that displays text with a font size of 20 and weight of 400.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_20_400(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: color));
}

/// A widget that displays text with a font size of 16 and weight of 600.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_16_600(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color));
}

/// A widget that displays text with a font size of 14 and weight of 400.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
/// - [textAlign]: The alignment of the text. Defaults to [TextAlign.start].
Widget text_14_400(String? value,
    [Color color = textColor, TextAlign textAlign = TextAlign.start]) {
  return Text(
    "$value",
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400),
    textAlign: textAlign,
    maxLines: 1,
  );
}

/// A widget that displays text with a font size of 14 and weight of 400 without a max line limit.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
/// - [textAlign]: The alignment of the text. Defaults to [TextAlign.start].
Widget text_14_400NoMax(String? value,
    [Color color = textColor, TextAlign textAlign = TextAlign.start]) {
  return Text(
    "$value",
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400),
    textAlign: textAlign,
  );
}

/// A widget that displays text with a font size of 14 and weight of 500.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_14_500(String? value, [Color color = textColor]) {
  return Text(
    "$value",
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
    overflow: TextOverflow.fade,
  );
}

/// A widget that displays text with a font size of 14 and weight of 600.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_14_600(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color));
}

/// A widget that displays text with a font size of 12 and weight of 400.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_12_400(String? value, [Color color = textColor]) {
  return Text(
    "$value",
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400),
  );
}

/// A widget that displays text with a font size of 12 and weight of 500.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_12_500(String? value, [Color color = textColor]) {
  return Text(
    "$value",
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
  );
}

/// A widget that displays text with a font size of 12 and weight of 400 with a max line limit of 1.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_12_400Max1(String? value, [Color color = textColor]) {
  return Text(
    "$value",
    style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400),
    maxLines: 1,
  );
}

/// A widget that displays text with a font size of 14 and weight of 700.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_14_700(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: color));
}

/// A widget that displays text with a font size of 10 and weight of 500.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_10_500(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: color));
}

/// A widget that displays text with a font size of 10 and weight of 400.
///
/// - [value]: The text to display.
/// - [color]: The color of the text. Defaults to [textColor].
Widget text_10_400(String? value, [Color color = textColor]) {
  return Text("$value",
      style:
          TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color));
}
