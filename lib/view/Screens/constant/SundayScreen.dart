import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';
import '../BottomNavigation/Bottom_Navigation_Menu.dart';

class SundayScreen extends StatelessWidget {
  const SundayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final BottomNavigationController bottomNavController = Get.find<BottomNavigationController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Sunday!',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Relax and Enjoy Your Sunday!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/defaultimage/happysunday.png',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Take a break, unwind, and recharge for the week ahead.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // bottomNavController.selectedIndex.value = 0; // Set index to 0
                // Get.off(() => BottomNavigationMenu());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
