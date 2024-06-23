// import 'package:flutter/animation.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// class HomeController extends GetxController with SingleGetTickerProviderMixin {
//   RxString greeting = ''.obs;
//   RxBool showSunrise = false.obs;
//   RxBool showMoon = false.obs;
//   late AnimationController sunriseController;
//   late AnimationController moonController;
//   late Animation<Offset> sunriseAnimation;
//   late Animation<Offset> moonAnimation;
//
//   @override
//   void onInit() {
//     super.onInit();
//     sunriseController = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//     sunriseAnimation = Tween<Offset>(
//       begin: Offset(0.0, 1.0),
//       end: Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: sunriseController,
//       curve: Curves.easeInOut,
//     ));
//
//     moonController = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//     moonAnimation = Tween<Offset>(
//       begin: Offset(0.0, -1.0),
//       end: Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: moonController,
//       curve: Curves.easeInOut,
//     ));
//
//     _updateGreeting();
//   }
//
//   @override
//   void onClose() {
//     sunriseController.dispose();
//     moonController.dispose();
//     super.onClose();
//   }
//
//   void _updateGreeting() {
//     final hour = DateTime.now().hour;
//
//     if (hour < 12) {
//       greeting.value = 'Good morning';
//       showSunrise.value = true;
//       sunriseController.forward();
//     } else if (hour < 17) {
//       greeting.value = 'Good afternoon';
//       showSunrise.value = false;
//       showMoon.value = false;
//     } else if (hour < 20) {
//       greeting.value = 'Good evening';
//       showSunrise.value = false;
//       showMoon.value = true;
//       moonController.forward();
//     } else {
//       greeting.value = 'Good night';
//       showSunrise.value = false;
//       showMoon.value = true;
//       moonController.forward();
//     }
//   }
// }



import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
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
      greeting.value = 'Good morning';
      showAnimation.value = true; // Show animation for morning
    } else if (hour < 17) {
      greeting.value = 'Good afternoon';
      showAnimation.value = false; // No animation for afternoon
    } else if (hour < 20) {
      greeting.value = 'Good evening';
      showAnimation.value = true; // Show animation for evening
    } else {
      greeting.value = 'Good night';
      showAnimation.value = true; // Show animation for night
    }
  }

  void toggleAnimation() {
    showAnimation.value = !showAnimation.value; // Toggle animation on tap
  }
}