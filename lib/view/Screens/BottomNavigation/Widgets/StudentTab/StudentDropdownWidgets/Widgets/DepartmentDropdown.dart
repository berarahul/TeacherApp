import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../../models/for_student_tab/Department_Model.dart';
import '../../../../../../../view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabDepartmentController.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';

class StudentTabDepartmentDropdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StudentTabDepartmentController departmentController = Get.put(StudentTabDepartmentController());
    final StudentTabSelectedDepartmentIdStore studentTabSelectedDepartmentIdStore = Get.put(StudentTabSelectedDepartmentIdStore());
    final StudentTabSemesterController semesterController = Get.put(StudentTabSemesterController()); // Use existing instance

    return Obx(() {
      if (departmentController.isLoading.value) {
        return CircularProgressIndicator();
      }

      // Ensure selected value exists in the list of departments
      StudentTabDepartmentModel? selectedValue = departmentController.selectedDepartment.value;
      if (selectedValue != null && !departmentController.departments.contains(selectedValue)) {
        selectedValue = null;
      }

      return DropdownButtonFormField<StudentTabDepartmentModel>(
        value: selectedValue,
        items: departmentController.departments
            .map((department) => DropdownMenuItem<StudentTabDepartmentModel>(
          value: department,
          child: Text(department.departmentName),
        ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            studentTabSelectedDepartmentIdStore.selectedDepartmentId = value.id;
            log("Selected Department id::${studentTabSelectedDepartmentIdStore.selectedDepartmentId}");
            departmentController.setSelectedDepartment(value);
            semesterController.clearData(); // Clear previous data
            semesterController.fetchAndStoreSubjects(); // Fetch new data
          }
        },
        decoration: InputDecoration(
          labelText: 'Select Department',
          border: OutlineInputBorder(),
        ),
      );
    });
  }
}
