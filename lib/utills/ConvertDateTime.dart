import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
  return dateFormat.format(dateTime.toUtc());
}

String formatISOToCustom(String isoTime) {
  // Parse the ISO time string to a DateTime object
  DateTime dateTime = DateTime.parse(isoTime);

  // Get day name
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  String dayName = days[dateTime.weekday - 1];

  // Get month name
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String monthName = months[dateTime.month - 1];

  // Format day, month, and year
  String day = dateTime.day.toString().padLeft(2, '0');
  String year = dateTime.year.toString();

  // Format time to 12-hour format
  int hour = dateTime.hour > 12
      ? dateTime.hour - 12
      : dateTime.hour == 0
          ? 12
          : dateTime.hour;
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String period = dateTime.hour >= 12 ? "PM" : "AM";

  // Combine into desired format
  return "$dayName, $day $monthName $year - ${hour.toString().padLeft(2, '0')}:$minute $period";
}

String extractMonthName(String isoTimestamp) {
  final dateTime = DateTime.parse(isoTimestamp);
  const monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  return monthNames[
      dateTime.month - 1]; // Subtract 1 because array is zero-indexed
}

String extractDate(String isoTimestamp) {
  final dateTime = DateTime.parse(isoTimestamp);
  return dateTime.day
      .toString()
      .padLeft(2, '0'); // Ensures the date is in two-digit format
}

String convertToDateFormat(String isoDate) {
  // Parse the ISO 8601 string into a DateTime object
  DateTime dateTime = DateTime.parse(isoDate);

  // Format the DateTime object to the desired format (YYYY-MM-DD)
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

  return formattedDate;
}
