import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../../../models/for_student_tab/SemesterModel.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';

class StudentTabSemesterDropdownWidgets extends StatelessWidget {
  final StudentTabSemesterController controller = Get.put(StudentTabSemesterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return DropdownButtonFormField<String>(
            value: controller.selectedSemester.value.isEmpty ? null : controller.selectedSemester.value,
            items: controller.semesters.map((semester) {
              return DropdownMenuItem<String>(
                value: semester.name,
                child: Text(semester.name),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                controller.setSelectedSemester(value);
              }
            },
            hint: Text("Select Semester"),
          );
        }),
        Obx(() {
          int selectedSemesterId = controller.semesters.firstWhere(
                (semester) => semester.name == controller.selectedSemester.value,
            orElse: () => Semester(id: -1, name: ''),
          ).id;

          List<Subject>? subjects = controller.getSubjectsBySemesterId(selectedSemesterId);
          return subjects != null
              ? ListView.builder(
            shrinkWrap: true,
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(subjects[index].name),
              );
            },
          )
              : Container();
        }),
      ],
    );
  }
}
