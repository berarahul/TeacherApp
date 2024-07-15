import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/for_student_tab/AttandanceFetchModel.dart';
import '../../../Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/selectedSubjectIdStore.dart';

class StudentController extends GetxController {
  var students = <StudentAttendance>[].obs;
  var totalClasses = 0.obs;
  var isLoading = true.obs;
  var lastFetched = ''.obs; // Add this to store the last fetched time

  final StudentTabSelectedDepartmentIdStore _departmentIdStore = StudentTabSelectedDepartmentIdStore();
  final StudentTabSelectedSubjectIdStore _subjectIdStore = StudentTabSelectedSubjectIdStore();

  @override
  void onInit() {
    fetchStudentsAttendance();
    super.onInit();
  }

  Future<void> fetchStudentsAttendance() async {
    int deptId = _departmentIdStore.selectedDepartmentId;
    int subId = _subjectIdStore.selectedSubjectId;

    isLoading.value = true;
    print('Fetching students attendance for deptId: $deptId and subId: $subId');

    try {
      final headers = await ApiHelper().getHeaders();
      final response = await ApiHelper.get('attendance/fetch?deptid=$deptId&subid=$subId', headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body); // Decode the JSON response
        print('API Response Data: $data'); // Print the raw data from the API

        var attendanceResponse = AttendanceResponse.fromJson(data); // Convert to model
        totalClasses.value = attendanceResponse.totalClass;
        students.value = attendanceResponse.studentsAttendanceList;
        lastFetched.value = DateTime.now().toString(); // Update last fetched time
        print('Data fetched successfully at ${lastFetched.value}');
      } else {
        throw Exception('Failed to load student attendance: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching student attendance: $e');
      throw Exception('Failed to load student attendance');
    } finally {
      isLoading.value = false;
      update();
    }
  }

  double calculateAttendancePercentage(int attendance) {
    return (attendance / totalClasses.value) * 100;
  }

  Color getAttendanceColor(double percentage) {
    if (percentage >= 75) {
      return Colors.green;
    } else if (percentage >= 51) {
      return Colors.orange;
    } else if (percentage >= 26) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  void resetState() {
    students.clear();
    totalClasses.value = 0;
    isLoading.value = true; // Reset isLoading to true when resetting state
  }
}
