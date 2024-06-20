import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataNotFoundScreen extends StatelessWidget {
  const DataNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'Data not found',
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
