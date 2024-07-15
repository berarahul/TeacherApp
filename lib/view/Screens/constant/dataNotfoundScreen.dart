import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DataNotFoundScreen extends StatelessWidget {
  const DataNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'you already Attendance to your all Classes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
