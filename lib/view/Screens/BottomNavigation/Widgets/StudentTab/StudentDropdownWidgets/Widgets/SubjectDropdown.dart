// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../../view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/selectedSubjectIdStore.dart';
// import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';
//  // Import your controller
//
// class StudentTabSubjectsDropdownWidget extends StatelessWidget {
//   final StudentTabSemesterController semesterController = Get.find<StudentTabSemesterController>(); // Assuming you're using GetX
//
//   final StudentTabSelectedSubjectIdStore selectedSubjectIdStore=Get.put(StudentTabSelectedSubjectIdStore());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       List<Map<String, String>> subjectList = semesterController.getSubjectNamesForSemester(semesterController.selectedSemester.value); // Replace '1' with the desired semester ID
//
//       return DropdownButtonFormField<Map<String, String>>(
//         value: null, // Set the initial value if needed
//         items: subjectList.map((subject) {
//           return DropdownMenuItem<Map<String, String>>(
//             value: subject,
//             child: Text(subject['name'] ?? ''), // Display the subject name
//           );
//         }).toList(),
//         onChanged: (value) {
//           // Handle dropdown item selection
//           print('Selected Subject: ${value?['name']}');
//
//           if (value != null && value['id'] != null && value['id']!.isNotEmpty) {
//             selectedSubjectIdStore.selectedSubjectId = int.parse(value['id']!);
//             print('Selected Subject ID: ${selectedSubjectIdStore.selectedSubjectId}');
//           }
//           // You can perform any action here based on the selected value
//         },
//         decoration: InputDecoration(
//           labelText: 'Select Subject',
//           border: OutlineInputBorder(),
//         ),
//       );
//     });
//   }
// }

//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../../../view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/selectedSubjectIdStore.dart';
// import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';
//
// class StudentTabSubjectsDropdownWidget extends StatelessWidget {
//   final StudentTabSemesterController semesterController = Get.find<StudentTabSemesterController>();
//   final StudentTabSelectedSubjectIdStore selectedSubjectIdStore = Get.put(StudentTabSelectedSubjectIdStore());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       List<Map<String, String>> subjectList = semesterController.getSubjectNamesForSemester(semesterController.selectedSemester.value);
//
//       return DropdownButtonFormField<Map<String, String>>(
//         value: null,
//         items: subjectList.map((subject) {
//           String truncatedName = _truncateSubjectName(subject['name'] ?? '');
//           return DropdownMenuItem<Map<String, String>>(
//             value: subject,
//             child: Tooltip(
//               message: subject['name'] ?? '',
//               child: Text(truncatedName),
//             ),
//           );
//         }).toList(),
//         onChanged: (value) {
//           print('Selected Subject: ${value?['name']}');
//
//           if (value != null && value['id'] != null && value['id']!.isNotEmpty) {
//             selectedSubjectIdStore.selectedSubjectId = int.parse(value['id']!);
//             print('Selected Subject ID: ${selectedSubjectIdStore.selectedSubjectId}');
//           }
//         },
//         decoration: InputDecoration(
//           labelText: 'Select Subject',
//           border: OutlineInputBorder(),
//         ),
//       );
//     });
//   }
//
//   String _truncateSubjectName(String name) {
//     const maxLength = 20; // Adjust the maximum length as needed
//     return name.length <= maxLength ? name : '${name.substring(0, maxLength)}...';
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/selectedSubjectIdStore.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTabsemesterController.dart';

class StudentTabSubjectsDropdownWidget extends StatelessWidget {
  final StudentTabSemesterController semesterController = Get.find<StudentTabSemesterController>();
  final StudentTabSelectedSubjectIdStore selectedSubjectIdStore = Get.put(StudentTabSelectedSubjectIdStore());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Map<String, String>> subjectList = semesterController.getSubjectNamesForSemester(semesterController.selectedSemester.value);

      return DropdownButtonFormField<Map<String, String>>(
        value: null,
        items: subjectList.map((subject) {
          String truncatedName = _truncateSubjectName(subject['name'] ?? '');
          return DropdownMenuItem<Map<String, String>>(
            value: subject,
            child: Tooltip(
              message: subject['name'] ?? '',
              child: Text(truncatedName),
            ),
          );
        }).toList(),
        onChanged: (value) {
          print('Selected Subject: ${value?['name']}');

          if (value != null && value['id'] != null && value['id']!.isNotEmpty) {
            selectedSubjectIdStore.selectedSubjectId = int.parse(value['id']!);
            print('Selected Subject ID: ${selectedSubjectIdStore.selectedSubjectId}');

            // Show a Snackbar with the full subject name
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(value?['name'] ?? ''),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        decoration: InputDecoration(
          labelText: 'Select Subject',
          border: OutlineInputBorder(),
        ),
      );
    });
  }

  String _truncateSubjectName(String name) {
    const maxLength = 20; // Adjust the maximum length as needed
    return name.length <= maxLength ? name : '${name.substring(0, maxLength)}...';
  }
}
