import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'StudentDropdownWidgets/Widgets/DepartmentDropdown.dart';
import 'StudentDropdownWidgets/Widgets/SemesterDropDown.dart';
import 'StudentDropdownWidgets/Widgets/SubjectDropdown.dart';


class Studentdropdownscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Students Dropdown ', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            StudentTabDepartmentDropdownWidgets(),
            SizedBox(height: 16),
            studentTabSemesterDropdownWidgets(),
            SizedBox(height: 16),
            StudentTabSubjectsDropdownWidgets(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),

    );
  }
}
