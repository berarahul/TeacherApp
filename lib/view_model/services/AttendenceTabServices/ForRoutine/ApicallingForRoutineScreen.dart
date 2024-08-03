// services/api_service.dart

import 'dart:convert';
import 'package:attendence/view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import 'package:http/http.dart' as http;

import '../../../../models/for_attandance_tab/TeacherWiseRoutineModel.dart';
import '../../../../res/AppUrl/AppUrl.dart';



Future<Map<String, List<Schedule>>> fetchSchedule() async {
  final url = AppUrl.fetchRoutine;  // Replace with your actual API URL
  final headers = await ApiHelper().getHeaders();
  final response = await http.get(Uri.parse(url),
  headers:headers,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    Map<String, List<Schedule>> schedule = {};

    data.forEach((day, list) {
      schedule[day] = (list as List).map((e) => Schedule.fromJson(e)).toList();
    });

    return schedule;
  } else {
    throw Exception('Failed to load schedule');
  }
}
