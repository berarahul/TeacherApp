import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AttendanceController extends GetxController {
  var students = <Student>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch students from API or define them here
    students.addAll([
      Student(name: 'John Doe', rollNumber: 1),
      Student(name: 'Jane Smith', rollNumber: 2),
      // Add more students as needed
    ]);
  }

  void toggleAttendance(int index) {
    students[index].isPresent = !students[index].isPresent;
  }
}

class Student {
  String name;
  int rollNumber;
  bool isPresent = false;

  Student({required this.name, required this.rollNumber});
}
