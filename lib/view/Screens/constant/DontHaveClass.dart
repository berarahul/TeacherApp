import 'package:attendence/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';
import '../BottomNavigation/Bottom_Navigation_Menu.dart';

class NoClassScreen extends StatelessWidget {
  const NoClassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavController = Get.find<BottomNavigationController>();

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.event_busy,
                size: 120,
                color: Colors.white,
              ),
              SizedBox(height: 30),
              Text(
                "No Classes This Semester",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "You may have classes in different semester",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {

                  bottomNavController.selectedIndex.value = 0; // Set index to 0
                  Get.off(() => BottomNavigationMenu());
                  // Add functionality here if needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appcolor,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Back to Home",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
