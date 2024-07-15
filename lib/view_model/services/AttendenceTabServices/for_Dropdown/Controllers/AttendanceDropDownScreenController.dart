
import 'package:get/get.dart';
class AttendanceDropDownScreenController extends GetxController {
  var selectedDepartmentId = Rxn<int>();
  var selectedSemesterId = Rxn<int>();
  var selectedSubjectId = Rxn<int>();
  var isLoading = false.obs;

  void resetSelections() {
    selectedDepartmentId.value = null;
    selectedSemesterId.value = null;
    selectedSubjectId.value = null;
  }

  void setLoading(bool value) {
    isLoading.value = value;
  }
}