import 'dart:convert';
import 'package:get/get.dart';
import 'package:attendence/repository/StudentDropdownRepository/StudentDropdownRepository.dart';

import '../../../../../models/for_student_tab/Department_Model.dart';

class StudentTabDepartmentController extends GetxController {
  var selectedDepartment =
      studenttabDepartmentModel(id: 0, departmentName: '').obs;
  var departments =
      <studenttabDepartmentModel>[].obs; // List of DepartmentModel
  var isLoading = false.obs; // For showing a loading indicator

  @override
  void onInit() {
    super.onInit();
    fetchDepartments(); // Fetch departments when the controller is initialized
  }

  void setSelectedDepartment(studenttabDepartmentModel department) {
    selectedDepartment.value = department;
    // Fetch semesters and subjects based on selected department
  }

  Future<void> fetchDepartments() async {
    try {
      isLoading.value = true; // Show loading indicator
      final response = await Studentdropdownrepository.allDepartmentDataFetch();
      print(response);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        departments.value = data
            .map((item) => studenttabDepartmentModel.fromJson(item))
            .toList();
      } else {
        // Handle error for unsuccessful API response
        print(
            'Failed to load departments. Status code: ${response.statusCode}');
        // Handle error
        throw Exception('Failed to load departments');
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }
}
