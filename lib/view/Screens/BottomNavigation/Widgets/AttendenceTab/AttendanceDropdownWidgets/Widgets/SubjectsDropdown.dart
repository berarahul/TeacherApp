import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

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
        String truncatedName = _truncateSubjectName(subject.subjectName);
        return DropdownMenuItem<Semesterwithsubjectmodel>(
          value: subject,
          child: Text(truncatedName),
          // Add tooltip for full name
          onTap: () => _showTooltip(subject.subjectName),
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

  String _truncateSubjectName(String name) {
    const maxLength = 20; // Adjust the maximum length as needed
    return name.length <= maxLength ? name : '${name.substring(0, maxLength)}...';
  }

  void _showTooltip(String subjectName) {
    // Show tooltip or other UI to display full subject name
    // You can use GetX's Get.snackbar for a simple tooltip-like display
    Get.snackbar('Full Name', subjectName);
  }
}
