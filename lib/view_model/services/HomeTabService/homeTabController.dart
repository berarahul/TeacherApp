
import 'package:attendence/res/AppUrl/AppUrl.dart';
import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../../../models/for_attandance_tab/TeacherWiseRoutineModel.dart';
import '../Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
import '../HolidayServices/HolidayChecker.dart';
import 'nextdayHolidayServicess.dart';


class HomeController extends GetxController {
  String? name = LoginStorageHelper.retrieveName();
  RxString greeting = ''.obs;
  RxList<Map<String, String>> holidays = <Map<String, String>>[].obs;
  RxList<Schedule> schedules = <Schedule>[].obs; // List of Schedule objects
  RxBool isHolidayTomorrow = false.obs;

  var tomorrowHolidayReasons = ''.obs;
  @override
  void onInit() {
    super.onInit();
    _updateGreeting();
    fetchingAllHolidays();
    fetchSchedule();
    checkForTomorrowHoliday();
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 12) {
      greeting.value = 'Good Morning\n$name';
    } else if (hour >= 12 && hour < 17) {
      greeting.value = 'Good Afternoon\n$name';
    } else if (hour >= 17 && hour < 22) {
      greeting.value = 'Good Evening\n$name';
    } else {
      greeting.value = 'Good Night\n$name';
    }
  }

  Future<void> fetchingAllHolidays() async {
    try {
      final holidaysList = await HolidayChecker.fetchingAllHolidays();
      holidays.value = holidaysList.map((holiday) {
        return {
          'reason': holiday['reason']!,
          'startDate': holiday['startDate']!,
          'endDate': holiday['endDate']!,
        };
      }).toList();
    } catch (e) {
      print('Failed to fetch holidays: $e');
      holidays.value = [];
    }
  }




  // check tomorrow is holiday or not

  // Future<void> checkForTomorrowHoliday() async {
  //   try {
  //     final service = NextDayHolidayService();
  //     final holidays = await service.fetchHolidays();
  //     bool holidayTomorrow = service.isHolidayTomorrow(holidays);
  //
  //     isHolidayTomorrow.value = holidayTomorrow;
  //     if (holidayTomorrow) {
  //       final tomorrowHoliday = holidays.firstWhere(
  //               (holiday) => holiday['startDate'] == DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1))),
  //           orElse: () => null
  //       );
  //       tomorrowHolidayReason.value = tomorrowHoliday?['reason'] ?? '';
  //     } else {
  //       tomorrowHolidayReason.value = '';
  //     }
  //   } catch (e) {
  //     print('Error checking tomorrow\'s holiday: $e');
  //     isHolidayTomorrow.value = false;
  //     tomorrowHolidayReason.value = '';
  //   }
  // }
  //


  Future<void> checkForTomorrowHoliday() async {
    try {
      final service = NextDayHolidayService();
      final holidays = await service.fetchHolidays();
      final tomorrow = DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1)));
      final tomorrowHolidays = holidays.where((holiday) => holiday['startDate'] == tomorrow).toList();

      isHolidayTomorrow.value = tomorrowHolidays.isNotEmpty;

      if (isHolidayTomorrow.value) {
        // Collect all holiday reasons for tomorrow
        final holidayReasons = tomorrowHolidays.map((holiday) => holiday['reason'] ?? '').toList();
        // Join reasons with a separator if you want to display them in a single string
        tomorrowHolidayReasons.value = holidayReasons.join(', ');
      } else {
        tomorrowHolidayReasons.value = '';
      }
    } catch (e) {
      print('Error checking tomorrow\'s holiday: $e');
      isHolidayTomorrow.value = false;
      tomorrowHolidayReasons.value = '';
    }
  }



  // Import for formatting and handling dates

  Future<void> fetchSchedule() async {
    try {
      var headers = await ApiHelper().getHeaders(); // Retrieve headers from ApiHelper
      final response = await http.get(
        Uri.parse(AppUrl.getRoutineByTeacher),
        headers: headers, // Pass headers to the request
      );

      if (response.statusCode == 200) {
        // Decode response as Map
        Map<String, dynamic> data = json.decode(response.body);
        print('Full API response: $data');
        // Get the current day of the week
        String currentDay = DateFormat('EEEE').format(DateTime.now()).toUpperCase();
        print('Current day: $currentDay');
        // Extract the list of schedules for the current day
        List<dynamic> dailySchedules = data[currentDay] ?? []; // Use currentDay to get the relevant day

        // Convert the list of JSON objects to Schedule instances
        List<Schedule> fetchedSchedules = dailySchedules
            .map((json) => Schedule.fromJson(json))
            .toList();
        print('Fetched schedules: $fetchedSchedules');
        // Assuming schedules is a List<Schedule>
        schedules.assignAll(fetchedSchedules);
      } else {
        print('Failed to load schedule');
      }
    } catch (e) {
      print('Error fetching schedule: $e');
    }
  }

  Gradient getBackgroundGradient() {
    switch (greeting.value.split('\n')[0]) {
      case 'Good Morning':
        return LinearGradient(
          colors: [Colors.yellow, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Good Afternoon':
        return LinearGradient(
          colors: [Colors.orangeAccent, Colors.yellowAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Good Evening':
        return LinearGradient(
          colors: [AppColors.softRed, AppColors.peach],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Good Night':
        return LinearGradient(
          colors: [Colors.indigo, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return LinearGradient(
          colors: [Colors.grey, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }
}

