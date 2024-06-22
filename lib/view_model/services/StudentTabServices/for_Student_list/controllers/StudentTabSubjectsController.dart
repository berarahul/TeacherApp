import 'package:get/get.dart';

class StudentTabSubjectController extends GetxController {
  var selectedSubject = ''.obs;
  var subjects = <String>['Math', 'Science', 'History'].obs;

  void setSelectedSubject(String value) {
    selectedSubject.value = value;
  }
}
