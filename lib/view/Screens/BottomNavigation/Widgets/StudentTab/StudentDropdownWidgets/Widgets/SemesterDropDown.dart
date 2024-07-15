import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';

class StudentTabSemesterDropdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StudentTabSemesterController controller = Get.put(StudentTabSemesterController());

    return Obx(() {
      return DropdownButtonFormField<String>(
        value: controller.selectedSemester.value.isNotEmpty
            ? controller.selectedSemester.value
            : null,
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
