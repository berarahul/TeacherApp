// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
// import '../../../../../models/for_student_tab/SemesterModel.dart';
// import '../../ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
// import '../../ForDropdown/StudentsDroodownHelperFunctions/selectedSemesterIdStore.dart';
//
// class StudentTabSemesterController extends GetxController {
//   var selectedSemester = '1'.obs;
//   var semesters = <Semester>[].obs;
//   var subjectsBySemester = <int, List<Subject>>{}.obs;
//   StudentTabSelectedSemesterIdStore selectedSemesterIdStore=Get.put(StudentTabSelectedSemesterIdStore());
//   void setSelectedSemester(String value) {
//     selectedSemester.value = value;
//     print(selectedSemester);
//     selectedSemesterIdStore.selectedSemesterId = int.parse(value); // Store the selected semester ID
//     print("Selected Semester ID: ${selectedSemesterIdStore.selectedSemesterId}");
//     getSubjectsForSemester(value);
//   }
//
//   void clearData() {
//     selectedSemester.value = '';
//     semesters.clear();
//     subjectsBySemester.clear();
//   }
//
//   Future<void> fetchAndStoreSubjects() async {
//     try {
//       int departmentId = StudentTabSelectedDepartmentIdStore().selectedDepartmentId;
//
//       final response = await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/subjects/$departmentId'));
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//
//         List<dynamic> subjectsJson = jsonResponse['subjects'];
//         for (var subjectJson in subjectsJson) {
//           Subject subject = Subject.fromJson(subjectJson);
//           int semesterId = subject.semesterId;
//           if (subjectsBySemester.containsKey(semesterId)) {
//             subjectsBySemester[semesterId]!.add(subject);
//           } else {
//             subjectsBySemester[semesterId] = [subject];
//           }
//         }
//
//         // Update semesters list based on keys in subjectsBySemester
//         semesters.clear();
//         subjectsBySemester.keys.forEach((semesterId) {
//           semesters.add(Semester(id: semesterId, name: 'Sem $semesterId'));
//         });
//
//         // Print the updated semesters list
//         print('Updated Semesters: $semesters');
//
//         // Print the subjects by semester map
//         print('Subjects by Semester:');
//         subjectsBySemester.forEach((key, value) {
//           print('Semester $key: $value');
//         });
//       } else {
//         throw Exception('Failed to load subjects');
//       }
//     } catch (e) {
//       print('Error fetching subjects: $e');
//     }
//   }
//
//
//   List<Subject> getSubjectsForSemester(String semesterId) {
//     List<Subject> subjects;
//     switch (semesterId) {
//       case '1':
//         subjects = subjectsBySemester[1] ?? [];
//         print(subjects);
//         break;
//       case '2':
//         subjects = subjectsBySemester[2] ?? [];
//         print(subjects);
//         break;
//         case '3':
//           subjects= subjectsBySemester[3] ?? [];
//           break;
//       case '4':
//         subjects = subjectsBySemester[4] ?? [];
//         break;
//       case '5':
//         subjects = subjectsBySemester[5] ?? [];
//         break;
//       case '6':
//         subjects = subjectsBySemester[6] ?? [];
//         break;
//
//
//       default:
//         subjects = [];
//         break;
//     }
//     return subjects;
//   }
//
//
//   List<Map<String, String>> getSubjectNamesForSemester(String semesterId) {
//     List<Map<String, String>> subjectList = [];
//     List<Subject> subjects = getSubjectsForSemester(semesterId);
//     subjects.forEach((subject) {
//       subjectList.add({'name': subject.name, 'id': subject.id.toString()}); // Empty string for ID
//     });
//     return subjectList;
//   }
//
// }



import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../../models/for_student_tab/SemesterModel.dart';
import '../../../Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/selectedSemesterIdStore.dart';

class StudentTabSemesterController extends GetxController {
  var selectedSemester = '1'.obs;
  var semesters = <Semester>[].obs;
  var subjectsBySemester = <int, List<Subject>>{}.obs;
  final ApiHelper apiHelper = ApiHelper(); // Instantiate ApiHelper

  StudentTabSelectedSemesterIdStore selectedSemesterIdStore = Get.put(StudentTabSelectedSemesterIdStore());

  void setSelectedSemester(String value) {
    selectedSemester.value = value;
    selectedSemesterIdStore.selectedSemesterId = int.parse(value); // Store the selected semester ID
    print("Selected Semester ID: ${selectedSemesterIdStore.selectedSemesterId}");
    getSubjectsForSemester(value);
  }

  void clearData() {
    selectedSemester.value = '1'; // Initial value reset
    semesters.clear();
    subjectsBySemester.clear();
  }

  Future<void> fetchAndStoreSubjects() async {
    try {
      int departmentId = StudentTabSelectedDepartmentIdStore().selectedDepartmentId;

      // Fetch headers using ApiHelper
      Map<String, String> headers;
      try {
        headers = await apiHelper.getHeaders();
      } catch (e) {
        print('Error getting headers: $e');
        return;
      }

      final response = await http.get(
        Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/subjects/$departmentId'),
        headers: headers, // Pass headers to the request
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        List<dynamic> subjectsJson = jsonResponse['subjects'];
        for (var subjectJson in subjectsJson) {
          Subject subject = Subject.fromJson(subjectJson);
          int semesterId = subject.semesterId;
          if (subjectsBySemester.containsKey(semesterId)) {
            subjectsBySemester[semesterId]!.add(subject);
          } else {
            subjectsBySemester[semesterId] = [subject];
          }
        }

        // Update semesters list based on keys in subjectsBySemester
        semesters.clear();
        subjectsBySemester.keys.forEach((semesterId) {
          semesters.add(Semester(id: semesterId, name: 'Sem $semesterId'));
        });

        // Print the updated semesters list
        print('Updated Semesters: $semesters');

        // Print the subjects by semester map
        print('Subjects by Semester:');
        subjectsBySemester.forEach((key, value) {
          print('Semester $key: $value');
        });
      } else {
        throw Exception('Failed to load subjects');
      }
    } catch (e) {
      print('Error fetching subjects: $e');
    }
  }

  List<Subject> getSubjectsForSemester(String semesterId) {
    List<Subject> subjects;
    int id = int.parse(semesterId);
    subjects = subjectsBySemester[id] ?? [];
    print(subjects);
    return subjects;
  }

  List<Map<String, String>> getSubjectNamesForSemester(String semesterId) {
    List<Map<String, String>> subjectList = [];
    List<Subject> subjects = getSubjectsForSemester(semesterId);
    subjects.forEach((subject) {
      subjectList.add({'name': subject.name, 'id': subject.id.toString()}); // Empty string for ID
    });
    return subjectList;
  }
}
