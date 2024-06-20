import 'dart:developer';
import 'package:attendence/repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import 'package:attendence/utils/logging/logger.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../models/for_attandance_tab/StudentData/StudentDataModel.dart';

class AttendanceController extends GetxController {
  var students = <StudentDataModel>[].obs;


  @override
  void onInit() {
    super.onInit();
    log("AttendanceController initialized");
    SchedulerBinding.instance.addPostFrameCallback((_) {

      fetchStudents();
    });
  }

  Future<void> fetchStudents() async {
    log("fetchStudents called");
    try {
      var response = await AttendanceDropDownRepository.StudentDataFetch();
      if (response is List) {
        List<StudentDataModel> fetchedStudents =
        response.map((data) => StudentDataModel.fromJson(data)).toList();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          students.assignAll(fetchedStudents);

          log("Students fetched and flag updated: ${students.length}");

          // Call resetState after fetching students successfully
          resetState();
        });
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      RLoggerHelper.error("Error fetching students: $e");
      log("Error fetching students: $e");
    }
  }

  void toggleAttendance(int index) {
    if (index >= 0 && index < students.length) {
      students[index].isPresent = !students[index].isPresent;
      students.refresh();
    } else {
      log("Invalid index: $index");
    }
  }

  void resetState() {
    log("State reset done");
  }
}
