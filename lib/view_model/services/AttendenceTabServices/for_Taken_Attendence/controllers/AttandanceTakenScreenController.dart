import 'dart:developer';

import 'package:attendence/repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import 'package:attendence/utils/logging/logger.dart';
import 'package:attendence/view_model/services/custom_Loading_service/customLoadingController.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../models/for_attandance_tab/StudentData/StudentDataModel.dart';

class AttendanceController extends GetxController {
  var students = <StudentDataModel>[].obs;
   var studentflag = false.obs; // Changed to an observable

  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      log("Before fetching students: ${studentflag.value}");
      fetchStudents();
    });
  }

  Future<void> fetchStudents() async {
    try {
      var response = await AttendanceDropDownRepository.StudentDataFetch();
      if (response is List) {
        List<StudentDataModel> fetchedStudents =
        response.map((data) => StudentDataModel.fromJson(data)).toList();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          students.assignAll(fetchedStudents);
          studentflag.value = true; // Update the flag here
          log("Students fetched and flag updated: ${students.length}");
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
      students.refresh(); // Refresh to update the UI
    } else {
      log("Invalid index: $index");
    }
  }

  void resetState() {
    students.clear();
    studentflag.value = false;
    log("State reset done");
  }
}
