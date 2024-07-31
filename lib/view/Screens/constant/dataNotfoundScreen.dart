import 'package:attendence/view/Screens/BottomNavigation/Widgets/HomeTab/Home_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';
import '../BottomNavigation/Bottom_Navigation_Menu.dart';

class DataNotFoundScreen extends StatelessWidget {
  const DataNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavController = Get.find<BottomNavigationController>();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Attendance Error'),
      //   backgroundColor: Colors.redAccent,
      // ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 100,
              ),
              SizedBox(height: 16),
              // Text(
              //   'No Attendance Records Found',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.redAccent,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(height: 16),
              Text(
                'You have already marked attendance for today all your classes.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                  bottomNavController.selectedIndex.value = 0; // Set index to 0
                  Get.off(() => BottomNavigationMenu());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'GO BACK TO Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
