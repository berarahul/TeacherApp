

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';

class HomeController extends GetxController {
  String? name = LoginStorageHelper.retrieveName();
  RxString greeting = ''.obs;
  RxBool showAnimation = false.obs;

  @override
  void onInit() {
    super.onInit();
    _updateGreeting();
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      greeting.value = '\t\t\t\tGood morning\t\t\t\t\n$name';
      showAnimation.value = true; // Show animation for morning
    } else if (hour < 17) {
      greeting.value = '\t\t\t\tGood afternoon\t\t\t\t\n$name';
      showAnimation.value = false; // No animation for afternoon
    } else if (hour < 20) {
      greeting.value = '\t\t\t\tGood evening\t\t\t\t\n$name';
      showAnimation.value = true; // Show animation for evening
    } else {
      greeting.value = '\t\t\t\tGood night\t\t\t\t\n$name';
      showAnimation.value = true; // Show animation for night
    }
  }

  void toggleAnimation() {
    showAnimation.value = !showAnimation.value; // Toggle animation on tap
  }
}