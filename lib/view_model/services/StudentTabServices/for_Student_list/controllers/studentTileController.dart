import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../models/for_student_tab/AttandanceFetchModel.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/selectedSubjectIdStore.dart';

class StudentController extends GetxController {
  var students = <StudentAttendance>[].obs;
  var totalClasses = 0.obs;
  var isLoading = true.obs;

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
print(deptId);
print(subId);
    final response = await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/attendance/fetch?deptid=$deptId&subid=$subId'));

    if (response.statusCode == 200) {
      var data = AttendanceResponse.fromJson(json.decode(response.body));
      totalClasses.value = data.totalClass;
      students.value = data.studentsAttendanceList;
    } else {
      throw Exception('Failed to load student attendance');
    }
    isLoading.value = false;
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
}
