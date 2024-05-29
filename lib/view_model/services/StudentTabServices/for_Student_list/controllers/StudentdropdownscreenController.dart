import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StudentdropdownscreenController extends GetxController {
  var selectedDepartment = ''.obs;
  var selectedSemester = ''.obs;
  var selectedSubject = ''.obs;

  // Dummy data for the dropdown items
  final List<String> departments = ['CSE', 'ECE', 'MECH'];
  final List<String> semesters = ['1st', '2nd', '3rd'];
  final List<String> subjects = ['Maths', 'Physics', 'Chemistry'];

  void submit() {
    // Implement your submission logic
    print('Submitted: $selectedDepartment, $selectedSemester, $selectedSubject');
  }
}