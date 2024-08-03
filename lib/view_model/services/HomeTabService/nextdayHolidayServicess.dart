import 'package:attendence/view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class NextDayHolidayService {

var headersFuture = ApiHelper().getHeaders();
  static const String _holidayApiUrl = 'https://attendancesystem-s1.onrender.com/api/holiday/allHolidays';

  Future<List<dynamic>> fetchHolidays() async {
  try {
  final headers = await headersFuture; // Retrieve headers
  final response = await http.get(
  Uri.parse(_holidayApiUrl),
  headers: headers, // Pass headers to the request
  );

  if (response.statusCode == 200) {
  // Decode the response body as a List
  return json.decode(response.body) as List<dynamic>;
  } else {
  throw Exception('Failed to load holidays');
  }
  } catch (e) {
  throw Exception('Failed to fetch holidays: $e');
  }
  }

  bool isHolidayTomorrow(List<dynamic> holidays) {
  DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  String tomorrowStr = DateFormat('yyyy-MM-dd').format(tomorrow);

  return holidays.any((holiday) {
  final startDate = holiday['startDate'] as String;
  final endDate = holiday['endDate'] as String;
  return startDate == tomorrowStr || endDate == tomorrowStr;
  });
  }
}
