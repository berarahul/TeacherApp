import 'package:flutter/material.dart';

import '../../../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

class SemesterDropdownWidget extends StatelessWidget {
  final Map<int, List<Semesterwithsubjectmodel>> semesterSubjectsMap;
  final ValueChanged<int?> onChanged;

  const SemesterDropdownWidget({
    Key? key,
    required this.semesterSubjectsMap,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> semesterItems = [];

    // Assuming keys in semesterSubjectsMap represent semester IDs
    semesterSubjectsMap.keys.forEach((semesterId) {
      semesterItems.add(
        DropdownMenuItem<int>(
          value: semesterId,
          child: Text('Semester $semesterId'),
        ),
      );
    });

    return DropdownButtonFormField<int>(
      items: semesterItems,
      onChanged: onChanged,
      hint: Text('Select Semester'),
    );
  }
}
