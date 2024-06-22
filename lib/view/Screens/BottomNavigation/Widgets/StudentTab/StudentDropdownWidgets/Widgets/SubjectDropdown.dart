import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/StudentTabSubjectsController.dart';


class StudentTabSubjectsDropdownWidgets extends StatelessWidget {
  final StudentTabSubjectController subjectController = Get.put(StudentTabSubjectController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        value: subjectController.selectedSubject.value.isEmpty
            ? null
            : subjectController.selectedSubject.value,
        items: subjectController.subjects
            .map((subject) => DropdownMenuItem<String>(
          value: subject,
          child: Text(subject),
        ))
            .toList(),
        onChanged: (value) {
          subjectController.setSelectedSubject(value!);
        },
        decoration: InputDecoration(
          labelText: 'Select Subject',
          border: OutlineInputBorder(),
        ),
      );
    });
  }
}
