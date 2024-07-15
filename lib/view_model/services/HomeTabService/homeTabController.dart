

import 'package:attendence/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';

class HomeController extends GetxController {
  String? name = LoginStorageHelper.retrieveName();
  RxString greeting = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _updateGreeting();
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 12) {
      greeting.value = 'Good morning\n$name';
    } else if (hour >= 12 && hour < 17) {
      greeting.value = 'Good afternoon\n$name';
    } else if (hour >= 17 && hour < 22) {
      greeting.value = 'Good evening\n$name';
    } else {
      greeting.value = 'Good night\n$name';
    }
  }

  Gradient getBackgroundGradient() {
    switch (greeting.value.split('\n')[0]) {
      case 'Good morning':
        return LinearGradient(
          colors: [Colors.yellow, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Good afternoon':
        return LinearGradient(
          colors: [Colors.orangeAccent, Colors.yellowAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Good evening':
        return LinearGradient(
          colors: [AppColors.softRed, AppColors.peach],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Good night':
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
