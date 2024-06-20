import 'package:get/get.dart';

class AttendanceSubmitController extends GetxController {
  var isSubmitting = false.obs;

  void setSubmitting(bool value) {
    isSubmitting.value = value;
  }
}
