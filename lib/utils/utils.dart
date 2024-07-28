import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constant.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: kTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: isTablet(context) ? 24 : 14),
      ),
    ),
  );
}

double calculateDeduction(double x) {
  // Calculate 15% of x
  double deduction = 0.15 * x;

  // Deduct the calculated amount from x
  double result = x - deduction;

  return result;
}

String getOneDecimal(dynamic value) {
  double doubleInput = double.parse(value);
  return doubleInput.toStringAsFixed(1);
}

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.shortestSide > 600;

bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;

String formatDate(DateTime? dateTime) =>
    DateFormat('yyyy-MM-dd').format(dateTime ?? DateTime.now());

String formatDateWithoutDashes(DateTime? dateTime) =>
    DateFormat('yyyyMMdd').format(dateTime ?? DateTime.now());

String formatDateWitTime(DateTime? dateTime) =>
    DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime ?? DateTime.now());

Future<DateTime?> getDateFromPicker(
    BuildContext context, DateTime? selectedDate) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2300),
  );

  return pickedDate;
}

String formatNumber(String value) {
  try {
    final numberFormatDe = NumberFormat('#,##0.00', 'en_US');
    String formattedNumberDe = numberFormatDe.format(double.parse(value));
    return formattedNumberDe;
  } catch (e) {
    return '';
  }
}

String getMainString(String input) {
  RegExp regex = RegExp(r'\(@F\)\s*([^,]+)');
  Match? match = regex.firstMatch(input);

  if (match != null && match.groupCount > 0) {
    return match.group(1)!;
  }

  return '';
}

double convertToDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else if (value is String) {
    return double.tryParse(value) ?? 0.0;
  } else {
    return 0.0; // Return a default value if the conversion fails
  }
}
