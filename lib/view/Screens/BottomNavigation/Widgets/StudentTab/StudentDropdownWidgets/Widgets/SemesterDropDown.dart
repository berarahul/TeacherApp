import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/StudentTabSemesterController.dart';


class studentTabSemesterDropdownWidgets extends StatelessWidget {
  final studentTabSemesterController semesterController = Get.put(studentTabSemesterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        value: semesterController.selectedSemester.value.isEmpty
            ? null
            : semesterController.selectedSemester.value,
        items: semesterController.semesters
            .map((semester) => DropdownMenuItem<String>(
          value: semester,
          child: Text(semester),
        ))
            .toList(),
        onChanged: (value) {
          semesterController.setSelectedSemester(value!);
        },
        decoration: InputDecoration(
          labelText: 'Select Semester',
          border: OutlineInputBorder(),
        ),
      );
    });
  }
}
