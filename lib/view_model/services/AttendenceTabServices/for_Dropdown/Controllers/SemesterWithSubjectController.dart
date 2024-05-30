import 'package:attendence/repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import 'package:get/get.dart';

import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

class SemesterWithSubjectsController extends GetxController {
  var semesterSubjectMap = <int, List<Semesterwithsubjectmodel>>{}.obs;
  var selectedSubject = <Semesterwithsubjectmodel>[].obs;
  final selectedSemester = "1".obs;


  void setSelectedSemester(String value) {
    selectedSemester.value = value;
    print("Selected Semester: $value");

  }

  void setSelectedSubject(String value) {
    selectedSubject.value = value as List<Semesterwithsubjectmodel>;

  }

  void updateSubjects(List<Semesterwithsubjectmodel> subjects) {
    selectedSubject.value = subjects;
  }

  Future<void> fetchSemesterSubjects() async {
    try {
      var response = await AttendanceDropDownRepository.semesterWithSubjectFetch();
      print(response);
      if (response != null && response is List<dynamic>) { // Handle potential non-model response
        List<Semesterwithsubjectmodel> semesterSubjects = response
            .map((item) => Semesterwithsubjectmodel.fromJson(item as Map<String, dynamic>))
            .toList();

        // Update the observable map directly with parsed semester subjects
        semesterSubjectMap.value = semesterSubjects.fold<Map<int, List<Semesterwithsubjectmodel>>>(
            {},
                (map, subject) {
              map[subject.semester] = (map[subject.semester] ?? [])..add(subject);
              return map;
            });
        print(semesterSubjectMap);
      } else {
        print("Invalid response from API");
      }
    } catch (e) {
      print("Error fetching semester subjects: $e");
    }
  }
}

