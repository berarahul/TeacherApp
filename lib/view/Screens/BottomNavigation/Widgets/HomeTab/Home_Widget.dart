//
//
// import 'package:attendence/res/Colors/AppColors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
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
//         backgroundColor: AppColors.primaryColor,
//         title: Text('Home'),
//         automaticallyImplyLeading: false,
//       ),
//       body: GestureDetector(
//         onTap: () {
//           controller.toggleAnimation(); // Trigger animation on tap
//         },
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(() => AnimatedContainer(
//                 duration: Duration(seconds: 1),
//                 color: _getColor(controller.greeting.value),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Text(
//                     controller.greeting.value,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               )),
//               SizedBox(height: 20),
//               Obx(() => AnimatedOpacity(
//                 opacity: controller.showAnimation.value ? 1.0 : 0.0,
//                 duration: Duration(seconds: 1),
//                 child: Text(
//                   'Animation here!',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )),
//             ],
//           ),
//         ),
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


import 'package:attendence/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../view_model/services/HomeTabService/homeTabController.dart';
import '../../../../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // title: Text('Home'),
        backgroundColor: Colors.blue.shade900, // Make app bar transparent
        elevation: 0, // Remove app bar shadow
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  controller.greeting.value,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              )),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

