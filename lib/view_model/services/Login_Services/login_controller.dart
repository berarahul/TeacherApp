import 'package:get/get.dart';

class LoginController extends GetxController {
  var obscureText = true.obs;
  var isLoading = false.obs;
  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void setLoading(bool value) {
    isLoading.value = value;
  }
}
