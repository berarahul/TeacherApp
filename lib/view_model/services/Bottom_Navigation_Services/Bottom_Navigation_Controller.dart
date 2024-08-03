import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SubjectController.dart';
import 'package:attendence/view_model/services/HolidayServices/HolidayChecker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
import '../../../view/Screens/BottomNavigation/Widgets/HomeTab/Home_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/ProfileTab/Profile_Widget.dart';
import '../../../view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';
import '../../../view/Screens/constant/Custom_Loading_widgets.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/AttendanceDropDownScreenController.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../AttendenceTabServices/for_Dropdown/Controllers/SemesterController.dart';
import '../StudentTabServices/for_Student_list/controllers/studentTabDepartmentController.dart';
import '../StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';
import '../custom_Loading_service/customLoadingController.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final DepartmentController departmentController = Get.put(DepartmentController());
  final StudentTabDepartmentController studentTab = Get.put(StudentTabDepartmentController());
  AttendanceDropDownScreenController attendanceDropDownScreenController = Get.put(AttendanceDropDownScreenController());
  StudentTabSemesterController studentTabSemesterController = Get.put(StudentTabSemesterController());
  SemestreController semesterController = Get.put(SemestreController());
  SubjectController subjectController = Get.put(SubjectController());

  final screens = [
    HomeScreen(),
    Obx(() {
      if (LoadingController.isLoading.value) {
        return GlobalLoadingWidget();
      } else {
        return AttendanceDropDownScreen();
      }
    }),
    Obx(() {
      if (LoadingController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Studentdropdownscreen();
      }
    }),
    ProfileScreen(),
  ];

  void onTabSelected(int index) async {
    if (index == 1) {
      final holidayCheck = await HolidayChecker.checkForHoliday();
      if (holidayCheck['isHoliday'] == 'true') {
        Get.snackbar(
          'Holiday',
          'Attendance is disabled today due to a holiday: ${holidayCheck['reason']}',
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
    }

    selectedIndex.value = index;

    if (index == 1) {
      departmentController.clearDepartments();
      semesterController.clearSemesterlist();
      subjectController.clearsubjects();
      attendanceDropDownScreenController.resetSelections();
      LoadingController.showLoading();

      await departmentController.fetchDepartments();

      LoadingController.hideLoading();
    } else if (index == 2) {
      LoadingController.showLoading();
      await studentTab.fetchDepartments();
      LoadingController.hideLoading();
    }
  }
}
