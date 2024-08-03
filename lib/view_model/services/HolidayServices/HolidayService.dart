import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../models/HolidayModels/HolidayModel.dart';

class HolidayService {
  static Future<List<Holiday>> fetchHolidays() async {
    final response = await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/holiday/holidays'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Holiday.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load holidays');
    }
  }
}