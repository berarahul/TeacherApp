import 'package:flutter/material.dart';

import '../../../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

class SubjectDropdownWidget extends StatelessWidget {
  final List<Semesterwithsubjectmodel> subjects;
  final ValueChanged<Semesterwithsubjectmodel?> onChanged;

  const SubjectDropdownWidget({
    Key? key,
    required this.subjects,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Semesterwithsubjectmodel>> subjectItems = [];

    subjects.forEach((subject) {
      subjectItems.add(
        DropdownMenuItem<Semesterwithsubjectmodel>(
          value: subject,
          child: Text(subject.subjectName),
        ),
      );
    });

    return DropdownButtonFormField<Semesterwithsubjectmodel>(
      items: subjectItems,
      onChanged: onChanged,
      hint: Text('Select Subject'),
    );
  }
}
