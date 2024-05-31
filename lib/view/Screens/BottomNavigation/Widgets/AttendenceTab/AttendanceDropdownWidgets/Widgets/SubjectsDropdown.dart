import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

class SubjectDropdownWidget extends StatelessWidget {
  final RxList<Semesterwithsubjectmodel> subjects;
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
      print(subject);
      subjectItems.add(
        DropdownMenuItem<Semesterwithsubjectmodel>(
          value: subject as Semesterwithsubjectmodel,
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










// import 'package:flutter/material.dart';
// import '../../../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';
//
//
// class SubjectDropdownWidget extends StatelessWidget {
//   final List<Semesterwithsubjectmodel> subjects;
//   final ValueChanged<Semesterwithsubjectmodel?> onChanged;
//
//   SubjectDropdownWidget({
//     required Key key,
//     required this.subjects,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<Semesterwithsubjectmodel>(
//       value: subjects.isNotEmpty ? subjects.first : null,
//       onChanged: onChanged,
//       hint: Text("Select Subject"),
//       items: subjects.map((Semesterwithsubjectmodel subject) {
//         return DropdownMenuItem<Semesterwithsubjectmodel>(
//           value: subject,
//           child: Text(subject.subjectName),
//         );
//       }).toList(),
//     );
//   }
// }
