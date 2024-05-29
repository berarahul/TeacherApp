import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/res/components/roundButton.dart';
import 'package:attendence/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: const Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/avatar.jpg'), // Replace with your asset image path
                      ),
                    ],
                  ),
                  SizedBox(width: 16.0), // Add some space between columns
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BCA',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Partha Mondal',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container()), // To push the buttons to the bottom
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundButton(
                  title: 'Settings',
                  onPress: () {},
                  width: 120,
                  height: 40,
                  buttonColor: RColors.GreenColor,
                  textColor: Colors.black,
                ),
                RoundButton(
                  title: 'Logout',
                  onPress: () {},
                  width: 120,
                  height: 40,
                  buttonColor: AppColors.redColor,
                  textColor: AppColors.textPrimary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
