import 'package:attendence/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
import '../HolidayServices/HolidayChecker.dart';

class HomeController extends GetxController {
  String? name = LoginStorageHelper.retrieveName();
  RxString greeting = ''.obs;
  RxList<Map<String, String>> holidays = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _updateGreeting();
    fetchingAllHolidays();
  }

  void _updateGreeting() {
    final hour = DateTime
        .now()
        .hour;

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
      final holidaysList = await HolidayChecker
          .fetchingAllHolidays(); // Fetch all holidays
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
