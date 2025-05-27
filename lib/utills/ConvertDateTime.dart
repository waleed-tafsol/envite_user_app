import 'package:event_planner_light/services/customPrint.dart';
import 'package:intl/intl.dart';

/*
String timeFormater(TimeOfDay time){
  //Duration timezoneOffset = time.timeZoneOffset;
 // String formattedOffset = _formatTimezoneOffset(timezoneOffset);
  String formattedDate = DateFormat('hh:mm a').format(time);
  return '$formattedDate';
}*/

String dateFormater(String? date) {
  if (date == null) {
    return "";
  }
  final dateTime = DateTime.tryParse(date)?.toLocal();
  if (dateTime == null) {
    return "";
  }
  String formattedDate = DateFormat('dd/MMM/yyyy').format(dateTime);
  ColoredPrint.green("utcTime: $date , localTime: ${formattedDate.toString()}");
  return formattedDate;
}

String formatToIso8601WithTimezone(DateTime date) {
  // Get the timezone offset (e.g., +00:00 or -05:00)
  Duration timezoneOffset = date.timeZoneOffset;
  String formattedOffset = _formatTimezoneOffset(timezoneOffset);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(date);

  // Append the timezone offset to the formatted date string
  return '$formattedDate$formattedOffset';
}

// Helper function to format the timezone offset
String _formatTimezoneOffset(Duration offset) {
  // Get the total hours and minutes from the duration
  int hours = offset.inHours;
  int minutes = offset.inMinutes % 60;

  // Format the offset to match the required format (+00:00 or -05:00)
  String formattedOffset =
      '${hours >= 0 ? '+' : '-'}${hours.abs().toString().padLeft(2, '0')}:${minutes.abs().toString().padLeft(2, '0')}';

  return formattedOffset;
}

String formatISOToCustom(String isoTime) {
  // Parse the ISO time string to a DateTime object
  DateTime dateTime = DateTime.parse(isoTime).toLocal();

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

String extractMonthInitials(String isoTimestamp) {
  final dateTime = DateTime.parse(isoTimestamp).toLocal();
  const monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return monthNames[
      dateTime.month - 1]; // Subtract 1 because array is zero-indexed
}

String extractDate(String isoTimestamp) {
  final dateTime = DateTime.parse(isoTimestamp).toLocal();
  ColoredPrint.green(
      "utcTime: $isoTimestamp , localTime: ${dateTime.toString()}");
  return dateTime.day
      .toString()
      .padLeft(2, '0'); // Ensures the date is in two-digit format
}

String convertToDateFormat(String isoDate) {
  // Parse the ISO 8601 string into a DateTime object
  DateTime dateTime = DateTime.parse(isoDate).toLocal();

  // Format the DateTime object to the desired format (YYYY-MM-DD)
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

  return formattedDate;
}
