// // BottomNavigationController.dart
// import 'package:attendence/view/Screens/constant/Custom_Loading_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// import '../../../view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
// import '../../../view/Screens/BottomNavigation/Widgets/HomeTab/Home_Widget.dart';
// import '../../../view/Screens/BottomNavigation/Widgets/ProfileTab/Profile_Widget.dart';
// import '../../../view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';
// import '../AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
// import '../custom_Loading_service/customLoadingController.dart'; // Import your LoadingController
//
//
//
// class BottomNavigationController extends GetxController {
//   final   Rx<int> selectedIndex = 0.obs;
//   final DepartmentController departmentController = Get.put(DepartmentController());
//
//   final screens = [
//     HomeScreen(),
//     Obx(() {
//       if (LoadingController.isLoading.value) {
//         // Show loading indicator while fetching departments
//         return GlobalLoadingWidget();
//       } else {
//         // Show dropdown screen after departments are fetched
//         return AttendanceDropDownScreen();
//       }
//     }),
//     Studentdropdownscreen(),
//     ProfileScreen(),
//   ];
//
//   // Function to handle click on Attendance tab
//   void onTabSelected(int index) async {
//     selectedIndex.value = index;
//     if (index == 1) { // Assuming the Attendance tab is at index 1
//       LoadingController.showLoading();
//       await departmentController.fetchDepartments();
//       LoadingController.hideLoading();
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
import '../../../view/Screens/BottomNavigation/Widgets/HomeTab/Home_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/ProfileTab/Profile_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';
import '../../../view/Screens/constant/Custom_Loading_widgets.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../StudentTabServices/for_Student_list/controllers/studentTabDepartmentController.dart';
import '../custom_Loading_service/customLoadingController.dart'; // Import your LoadingController


class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final DepartmentController departmentController = Get.put(DepartmentController());
final StudentTabDepartmentController studentTab = Get.put(StudentTabDepartmentController());
  final screens = [
    HomeScreen(),
    Obx(() {
      if (LoadingController.isLoading.value) {
        // Show loading indicator while fetching departments
        return GlobalLoadingWidget();
      } else {
        // Show dropdown screen after departments are fetched
        return AttendanceDropDownScreen();
      }
    }),
    Obx(() {
      if (LoadingController.isLoading.value) {
        // Show circular progress indicator while fetching student data
        return Center(child: CircularProgressIndicator());
      } else {
        // Show student dropdown screen after data is fetched
        return Studentdropdownscreen();
      }
    }),
    ProfileScreen(),
  ];

  // Function to handle click on tab
  void onTabSelected(int index) async {
    selectedIndex.value = index;
    if (index == 1) { // Attendance tab selected
      LoadingController.showLoading();
      await departmentController.fetchDepartments();
      LoadingController.hideLoading();
    } else if (index == 2) { // Student tab selected
      LoadingController.showLoading();
      // Simulate fetching student data
     await studentTab.fetchDepartments();
      LoadingController.hideLoading();
    }
  }
}

//
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
// import '../../../view/Screens/BottomNavigation/Widgets/HomeTab/Home_Widget.dart';
// import '../../../view/Screens/BottomNavigation/Widgets/ProfileTab/Profile_Widget.dart';
// import '../../../view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';
// import '../../../view/Screens/constant/Custom_Loading_widgets.dart';
// import '../AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
// import '../custom_Loading_service/customLoadingController.dart'; // Import your LoadingController
//
// class BottomNavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;
//   final RxBool isAttendanceDataFetched = false.obs; // Track if Attendance data has been fetched
//   final DepartmentController departmentController = Get.put(DepartmentController());
//
//   final screens = [
//     HomeScreen(),
//     Obx(() {
//       if (LoadingController.isLoading.value) {
//         // Show loading indicator while fetching departments
//         return GlobalLoadingWidget();
//       } else {
//         // Show dropdown screen after departments are fetched
//         return isAttendanceDataFetched.value ? AttendanceDropDownScreen() : GlobalLoadingWidget();
//       }
//     }),
//     Studentdropdownscreen(),
//     ProfileScreen(),
//   ];
//
//   // Function to handle click on Attendance tab
//   void onTabSelected(int index) async {
//     selectedIndex.value = index;
//     if (index == 1) { // Assuming the Attendance tab is at index 1
//       if (!isAttendanceDataFetched.value) { // Check if data has not been fetched
//         LoadingController.showLoading();
//         await departmentController.fetchDepartments();
//         LoadingController.hideLoading();
//         isAttendanceDataFetched.value = true; // Mark data as fetched
//       } else {
//         // Clear previous data here before fetching again
//         departmentController.clearDepartments(); // Example method to clear departments
//         // Add similar methods for clearing other data if necessary
//         LoadingController.showLoading();
//         await departmentController.fetchDepartments();
//         LoadingController.hideLoading();
//       }
//     }
//   }
// }
