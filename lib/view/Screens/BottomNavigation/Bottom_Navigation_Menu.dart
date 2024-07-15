import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helperFunctions.dart';
import '../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());
    final darkmode = RHelperFunction.isDarkMode(context);
    // Helper function to get the correct icon path based on the theme
    String getIconPath(String iconName) {
      return darkmode ? 'assets/icons/dark/$iconName' : 'assets/icons/light/$iconName';
    }
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
          destinations:  [
            NavigationDestination(
              icon: Image.asset(
                getIconPath('home.png'),
                width: 24,
                height: 24,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Image.asset(
                getIconPath('attendance.png'),
                width: 24,
                height: 24,
              ),
              label: 'Attendance',
            ),
            NavigationDestination(
              icon: Image.asset(
                getIconPath('student.png'),
                width: 24,
                height: 24,
              ),
              label: 'Students',
            ),
            NavigationDestination(
              icon: Image.asset(
                getIconPath('profile.png'),
                width: 24,
                height: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
