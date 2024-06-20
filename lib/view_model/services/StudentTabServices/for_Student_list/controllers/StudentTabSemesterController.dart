import 'package:get/get.dart';

class studentTabSemesterController extends GetxController {
  var selectedSemester = ''.obs;
  var semesters = <String>['Sem 1', 'Sem 2', 'Sem 3'].obs;

  void setSelectedSemester(String value) {
    selectedSemester.value = value;
    // Fetch subjects based on selected semester
  }
}
