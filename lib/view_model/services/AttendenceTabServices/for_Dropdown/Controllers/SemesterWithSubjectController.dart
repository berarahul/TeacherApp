import 'dart:developer';

import 'package:attendence/repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import 'package:get/get.dart';
import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

class SemesterWithSubjectsController extends GetxController {
  var semesterSubjectMap = <int, List<Semesterwithsubjectmodel>>{}.obs;
  var selectedSubject = Rx<Semesterwithsubjectmodel?>(null);
  final selectedSemester = "0".obs;

  void setSelectedSemester(String value) {
    selectedSemester.value = value;
    print("Selected Semester: $value");
  }

  void setSelectedSubject(Semesterwithsubjectmodel? value) {
    selectedSubject.value = value;
    print(value);
  }

  void updateSubjects(List<Semesterwithsubjectmodel> subjects) {
    // Not necessary for this controller, keeping for consistency
  }

  Future<void> fetchSemesterSubjects() async {
    try {
      var response =
          await AttendanceDropDownRepository.semesterWithSubjectFetch();
      print(response);
      if (response != null && response is List<dynamic>) {
        List<Semesterwithsubjectmodel> semesterSubjects = response
            .map(
              (item) => Semesterwithsubjectmodel.fromJson(
                  item as Map<String, dynamic>),
            )
            .toList();

        // Update the observable map directly with parsed semester subjects
        semesterSubjectMap.value =
            semesterSubjects.fold<Map<int, List<Semesterwithsubjectmodel>>>(
          {},
          (map, subject) {
            map[subject.semester] = (map[subject.semester] ?? [])..add(subject);
            return map;
          },
        );
        print(semesterSubjectMap);
        log(semesterSubjectMap.toString());
      } else {
        print("Invalid response from API");
      }
    } catch (e) {
      print("Error fetching semester subjects: $e");
    }
  }


  void clearSelections() {
    selectedSemester.value = '';
    selectedSubject.value = null;
    // Clear any other related data if necessary
  }
}



//
// import 'package:attendence/repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
// import 'package:get/get.dart';
// import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';
//
// class SemesterWithSubjectsController extends GetxController {
//   var semesters = <int>[].obs; // List to store semesters
//   var subjects = <Semesterwithsubjectmodel>[].obs; // List to store subjects
//   var selectedSubject = Rx<Semesterwithsubjectmodel?>(null);
//   var selectedSemester = Rx<int?>(null);
//
//   void setSelectedSemester(int? value) {
//     selectedSemester.value = value;
//     if (value != null) {
//       fetchSubjectsForSemester(value);
//     }
//     print("Selected Semester: $value");
//   }
//
//   void setSelectedSubject(Semesterwithsubjectmodel? value) {
//     selectedSubject.value = value;
//     print(value);
//   }
//
//   void updateSemesters(List<int> semesterList) {
//     semesters.value = semesterList;
//   }
//
//   void updateSubjects(List<Semesterwithsubjectmodel> subjectList) {
//     subjects.value = subjectList;
//   }
//
//   Future<void> fetchSemesters() async {
//     try {
//       var response = await AttendanceDropDownRepository.semesterWithSubjectFetch();
//       print(response);
//       if (response != null && response is List<dynamic>) {
//         List<Semesterwithsubjectmodel> semesterSubjects = response
//             .map(
//               (item) => Semesterwithsubjectmodel.fromJson(item as Map<String, dynamic>),
//         )
//             .toList();
//
//         // Extract unique semesters from the response
//         List<int> semesterList = semesterSubjects.map((e) => e.semester).toSet().toList();
//         updateSemesters(semesterList);
//         print(semesters);
//       } else {
//         print("Invalid response from API");
//       }
//     } catch (e) {
//       print("Error fetching semesters: $e");
//     }
//   }
//
//   Future<void> fetchSubjectsForSemester(int semester) async {
//     try {
//       var response = await AttendanceDropDownRepository.semesterWithSubjectFetch();
//       print(response);
//       if (response != null && response is List<dynamic>) {
//         List<Semesterwithsubjectmodel> semesterSubjects = response
//             .map(
//               (item) => Semesterwithsubjectmodel.fromJson(item as Map<String, dynamic>),
//         )
//             .toList();
//
//         // Filter subjects based on the selected semester
//         List<Semesterwithsubjectmodel> subjectList = semesterSubjects
//             .where((subject) => subject.semester == semester)
//             .toList();
//         updateSubjects(subjectList);
//         print(subjects);
//       } else {
//         print("Invalid response from API");
//       }
//     } catch (e) {
//       print("Error fetching subjects: $e");
//     }
//   }
// }
