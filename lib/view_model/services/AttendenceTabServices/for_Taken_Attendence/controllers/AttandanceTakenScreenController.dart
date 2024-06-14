import 'package:attendence/repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import 'package:attendence/view_model/services/custom_Loading_service/customLoadingController.dart';
import 'package:get/get.dart';

import '../../../../../models/for_attandance_tab/StudentData/StudentDataModel.dart';

class AttendanceController extends GetxController {
  var students = <StudentDataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      LoadingController.showLoading();
      var response = await AttendanceDropDownRepository.StudentDataFetch();
      List<StudentDataModel> fetchedStudents = (response as List)
          .map((data) => StudentDataModel.fromJson(data))
          .toList();
      students.assignAll(fetchedStudents);
    } catch (e) {
      print("Error fetching students: $e");
    } finally {
      LoadingController.hideLoading();
    }
  }

  void toggleAttendance(int index) {
    students[index].isPresent = !students[index].isPresent;
    print(index);
    students.refresh(); // Refresh to update the UI
  }
}