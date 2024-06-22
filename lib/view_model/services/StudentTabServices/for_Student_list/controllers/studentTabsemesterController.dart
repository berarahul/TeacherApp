import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../../models/for_student_tab/SemesterModel.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';

class StudentTabSemesterController extends GetxController {
  var selectedSemester = ''.obs;
  var semesters = <Semester>[].obs;
  var subjectsBySemester = <int, List<Subject>>{}.obs;

  void setSelectedSemester(String value) {
    selectedSemester.value = value;
  }

  Future<void> fetchAndStoreSubjects() async {
    try {
      int departmentId = StudentTabSelectedDepartmentIdStore().selectedDepartmentId;

      final response = await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/subjects/$departmentId'));
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

  List<Subject>? getSubjectsBySemesterId(int semesterId) {
    return subjectsBySemester[semesterId];
  }
}
