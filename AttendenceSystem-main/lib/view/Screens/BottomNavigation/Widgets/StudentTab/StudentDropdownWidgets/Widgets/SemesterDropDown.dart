// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
//
//
// import '../../../../../../../models/for_attandance_tab/SemesterModel.dart';
//
// class SemesterDropdownWidget extends StatelessWidget {
//   final RxList<SemesterModel> semesters;
//   final ValueChanged<SemesterModel?> onChanged;
// // Change the type of onChanged
//
//   const SemesterDropdownWidget({
//     required this.semesters,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<SemesterModel>(
//       items: semesters.map((semesters) {
//         return DropdownMenuItem<SemesterModel>(
//           value: semesters,
//           child: Text(semesters.semester as String),
//         );
//       }).toList(),
//       onChanged: onChanged,
//       hint: Text('Select Semester'),
//     );
//   }
// }