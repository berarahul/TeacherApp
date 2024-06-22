import 'dart:developer';

import 'package:attendence/view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
import 'package:attendence/view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../models/for_student_tab/Department_Model.dart';
import '../../../../../../../repository/StudentDropdownRepository/StudentDropdownRepository.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabDepartmentController.dart';
 // Adjust the path as needed

class StudentTabDepartmentDropdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StudentTabDepartmentController departmentController = Get.put(StudentTabDepartmentController());
StudentTabSelectedDepartmentIdStore studentTabSelectedDepartmentIdStore=Get.put(StudentTabSelectedDepartmentIdStore());
    return Obx(() {
      if (departmentController.isLoading.value) {
        return CircularProgressIndicator();
      }
      return DropdownButtonFormField<StudentTabDepartmentModel>(
        value: departmentController.selectedDepartment.value,
        items: departmentController.departments
            .map((department) => DropdownMenuItem<StudentTabDepartmentModel>(
          value: department,
          child: Text(department.departmentName),
        ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            studentTabSelectedDepartmentIdStore.selectedDepartmentId= value.id;
            log("Selected Department id::${studentTabSelectedDepartmentIdStore.selectedDepartmentId}");
            departmentController.setSelectedDepartment(value);
            StudentTabSemesterController().fetchAndStoreSubjects();
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
