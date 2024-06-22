import 'package:attendence/models/for_student_tab/SemesterModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';

class StudentTabSemesterDropdownWidgets extends StatelessWidget {
  final StudentTabSemesterController controller = Get.put(StudentTabSemesterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        value: controller.selectedSemester.value.isEmpty ? null : controller.selectedSemester.value,
        onChanged: (value) {
          if (value != null) {
            controller.setSelectedSemester(value);
          }
        },
        items: controller.semesters.map((semester) {
          return DropdownMenuItem<String>(
            value: semester.id.toString(),
            child: Text(semester.name),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'Select Semester',
          border: OutlineInputBorder(),
        ),
      );
    });
  }
}


