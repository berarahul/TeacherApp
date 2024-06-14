import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';
import '../BottomNavigation/Bottom_Navigation_Menu.dart';

class Attendancesuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            const SizedBox(height: 20),
            const Text(
              'Successfully Attendance \nSubmitted',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 180),

            // To add some space between the text and the button
            ElevatedButton(
              onPressed: () {

                Get.to(BottomNavigationMenu());
              },
              child: Text('GO BACK TO Attendance'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}