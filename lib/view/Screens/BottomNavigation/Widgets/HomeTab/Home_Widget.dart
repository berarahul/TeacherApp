// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../../../../../view_model/services/HomeTabService/homeTabController.dart';
//
// class HomeScreen extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Stack(
//         children: [
//           Obx(() => AnimatedContainer(
//             duration: Duration(seconds: 3),
//             color: _getColor(controller.greeting.value),
//             child: Center(
//               child: Text(
//                 controller.greeting.value,
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//           )),
//           if (controller.showSunrise.value)
//             AnimatedBuilder(
//               animation: controller.sunriseController,
//               builder: (context, child) {
//                 return Transform.translate(
//                   offset: controller.sunriseAnimation.value,
//                   child: child,
//                 );
//               },
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.yellow,
//                   ),
//                 ),
//               ),
//             ),
//           if (controller.showMoon.value)
//             AnimatedBuilder(
//               animation: controller.moonController,
//               builder: (context, child) {
//                 return Transform.translate(
//                   offset: controller.moonAnimation.value,
//                   child: child,
//                 );
//               },
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Color _getColor(String greeting) {
//     switch (greeting) {
//       case 'Good morning':
//         return Colors.orange.shade200;
//       case 'Good afternoon':
//         return Colors.yellow.shade200;
//       case 'Good evening':
//         return Colors.blue.shade200;
//       case 'Good night':
//         return Colors.black;
//       default:
//         return Colors.blue.shade200;
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../view_model/services/HomeTabService/homeTabController.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GestureDetector(
        onTap: () {
          controller.toggleAnimation(); // Trigger animation on tap
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => AnimatedContainer(
                duration: Duration(seconds: 1),
                color: _getColor(controller.greeting.value),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    controller.greeting.value,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              SizedBox(height: 20),
              Obx(() => AnimatedOpacity(
                opacity: controller.showAnimation.value ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Animation here!',
                  style: TextStyle(fontSize: 18),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(String greeting) {
    switch (greeting) {
      case 'Good morning':
        return Colors.orange.shade200;
      case 'Good afternoon':
        return Colors.yellow.shade200;
      case 'Good evening':
        return Colors.blue.shade200;
      case 'Good night':
        return Colors.black;
      default:
        return Colors.blue.shade200;
    }
  }
}
