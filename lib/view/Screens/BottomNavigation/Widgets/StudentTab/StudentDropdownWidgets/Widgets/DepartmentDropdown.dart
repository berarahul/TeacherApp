import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../models/for_student_tab/Department_Model.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabDepartmentController.dart';


class StudentTabDepartmentDropdownWidgets extends StatelessWidget {
  final StudentTabDepartmentController departmentController = Get.put(StudentTabDepartmentController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (departmentController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (departmentController.departments.isEmpty) {
        return Center(child: Text('No departments available'));
      } else {
        return DropdownButtonFormField<studenttabDepartmentModel>(
          value: departmentController.selectedDepartment.value.id == 0
              ? null
              : departmentController.selectedDepartment.value,
          items: departmentController.departments
              .map((department) => DropdownMenuItem<studenttabDepartmentModel>(
            value: department,
            child: Text(department.departmentName),
          ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              departmentController.setSelectedDepartment(value);
            }
          },
          decoration: InputDecoration(
            labelText: 'Select Department',
            border: OutlineInputBorder(),
          ),
        );
      }
    });
  }
}
