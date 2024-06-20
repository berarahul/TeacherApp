// BottomNavigationController.dart
import 'package:attendence/view/Screens/constant/Custom_Loading_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
import '../../../view/Screens/BottomNavigation/Widgets/ProfileTab/Profile_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../custom_Loading_service/customLoadingController.dart'; // Import your LoadingController



class BottomNavigationController extends GetxController {
  final   Rx<int> selectedIndex = 0.obs;
  final DepartmentController departmentController = Get.put(DepartmentController());

  final screens = [
    Container(
      color: Colors.blue,
    ),
    Obx(() {
      if (LoadingController.isLoading.value) {
        // Show loading indicator while fetching departments
        return GlobalLoadingWidget();
      } else {
        // Show dropdown screen after departments are fetched
        return AttendanceDropDownScreen();
      }
    }),
    Studentdropdownscreen(),
    ProfileScreen(),
  ];

  // Function to handle click on Attendance tab
  void onTabSelected(int index) async {
    selectedIndex.value = index;
    if (index == 1) { // Assuming the Attendance tab is at index 1
      LoadingController.showLoading();
      await departmentController.fetchDepartments();
      LoadingController.hideLoading();
    }
  }
}
