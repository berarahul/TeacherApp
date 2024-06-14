import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

class SubjectDropdownWidget extends StatelessWidget {
  final List<Semesterwithsubjectmodel> subjects;
  final ValueChanged<Semesterwithsubjectmodel?> onChanged;
  final Rx<Semesterwithsubjectmodel?> selectedSubject;

  const SubjectDropdownWidget({
    Key? key,
    required this.subjects,
    required this.onChanged,
    required this.selectedSubject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<DropdownMenuItem<Semesterwithsubjectmodel>> subjectItems =
          subjects.map((subject) {
        return DropdownMenuItem<Semesterwithsubjectmodel>(
          value: subject,
          child: Text(subject.subjectName),
        );
      }).toList();

      return DropdownButtonFormField<Semesterwithsubjectmodel>(
        items: subjectItems,
        onChanged: (Semesterwithsubjectmodel? newValue) {
          selectedSubject.value = newValue;
          onChanged(newValue);
        },
        value: selectedSubject.value,
        hint: Text('Select Subject'),
      );
    });
  }
}
