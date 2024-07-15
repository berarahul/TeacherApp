import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
import '../../../view/Screens/BottomNavigation/Widgets/HomeTab/Home_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/ProfileTab/Profile_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';
import '../../../view/Screens/constant/Custom_Loading_widgets.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/AttendanceDropDownScreenController.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';
import '../StudentTabServices/for_Student_list/controllers/studentTabDepartmentController.dart';
import '../StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';
import '../custom_Loading_service/customLoadingController.dart'; // Import your LoadingController


class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final DepartmentController departmentController = Get.put(DepartmentController());
final StudentTabDepartmentController studentTab = Get.put(StudentTabDepartmentController());
  AttendanceDropDownScreenController attendanceDropDownScreenController = Get.put(AttendanceDropDownScreenController());
  StudentTabSemesterController studentTabSemesterController = Get.put(StudentTabSemesterController());
  SemesterWithSubjectsController semesterWithSubjectsController=Get.put(SemesterWithSubjectsController());
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
    if (index == 1) {
       departmentController.clearDepartments();
        semesterWithSubjectsController.semesterSubjectMapclear();
      // Attendance tab selected
      attendanceDropDownScreenController.resetSelections();
      LoadingController.showLoading();

      await departmentController.fetchDepartments();

      LoadingController.hideLoading();

    } else if (index == 2) {

      // Student tab selected
      LoadingController.showLoading();
      // Simulate fetching student data
     await studentTab.fetchDepartments();
      LoadingController.hideLoading();
    }
  }
}
