// import 'dart:ffi';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/helpers/helperFunctions.dart';
// import '../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';
// class BottomNavigationMenu extends StatelessWidget {
//   const BottomNavigationMenu({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     final controller = Get.put(BottomNavigationController());
//     final darkmode=RHelperFunction.isDarkMode(context);
//
//    return Scaffold(
//
//      bottomNavigationBar: Obx(
//        ()=>NavigationBar(
//        height: 80,
//          elevation: 0,
//          selectedIndex: controller.selectedIndex.value,
//          onDestinationSelected:(Index) => controller.selectedIndex.value=Index,
//          backgroundColor: darkmode? RColors.dark : RColors.light,
//          indicatorColor: darkmode? RColors.light.withOpacity(0.1) : RColors.dark.withOpacity(0.1),
//          destinations: const [
//            NavigationDestination(icon:Icon(Iconsax.home), label: 'Home'),
//            NavigationDestination(icon:Icon(Iconsax.calendar), label: 'Attendance'),
//            NavigationDestination(icon:Icon(Iconsax.man), label: 'Students'),
//            NavigationDestination(icon:Icon(Iconsax.profile), label: 'Profile'),
//          ],
//        ),
//      ),
//     body:Obx(()=>controller.screens[controller.selectedIndex.value]),
//
//    );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helperFunctions.dart';
import '../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());
    final darkmode = RHelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.onTabSelected(index); // Call the onTabSelected method
          },
          backgroundColor: darkmode ? RColors.dark : RColors.light,
          indicatorColor: darkmode ? RColors.light.withOpacity(0.1) : RColors.dark.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.calendar), label: 'Attendance'),
            NavigationDestination(icon: Icon(Iconsax.man), label: 'Students'),
            NavigationDestination(icon: Icon(Iconsax.profile), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
