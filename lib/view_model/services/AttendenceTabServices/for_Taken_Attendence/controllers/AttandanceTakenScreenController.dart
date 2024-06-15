import 'package:attendence/repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import 'package:attendence/utils/logging/logger.dart';
import 'package:attendence/view_model/services/custom_Loading_service/customLoadingController.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../models/for_attandance_tab/StudentData/StudentDataModel.dart';

class AttendanceController extends GetxController {
  var students = <StudentDataModel>[].obs;
bool studentflag=false;
  @override
  void onInit() {
    super.onInit();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchStudents();
      studentflag=true;
    });
  }

  Future<void> fetchStudents() async {
    try {

      var response = await AttendanceDropDownRepository.StudentDataFetch();
      if (response is List) {
        List<StudentDataModel> fetchedStudents = response.map((data) => StudentDataModel.fromJson(data)).toList();
        // Use `assignAll` within a SchedulerBinding to delay the update
        SchedulerBinding.instance.addPostFrameCallback((_) {
          students.assignAll(fetchedStudents);
          print(response);

        });
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      // Use a proper logging method instead of print
      RLoggerHelper.error("Error fetching students", e);
      print("Error fetching students: $e");
    } finally {

    }
  }

  void toggleAttendance(int index) {
    if (index >= 0 && index < students.length) {
      students[index].isPresent = !students[index].isPresent;
      students.refresh(); // Refresh to update the UI
    } else {
      // Log invalid index access attempt
      print("Invalid index: $index");
    }
  }
}
