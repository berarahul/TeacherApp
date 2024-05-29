import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
import '../../../view/Screens/BottomNavigation/Widgets/ProfileTab/Profile_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';


class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(
      color: Colors.blue,
    ),

    AttendanceDropDownScreen(),
    Studentdropdownscreen(),

    ProfilePage()
  ];
}
