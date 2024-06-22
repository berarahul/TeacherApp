import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/res/components/roundButton.dart';
import 'package:attendence/view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropdownWidgets/Widgets/student_tile.dart';
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
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: Text('Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 16),
            StudentTabDepartmentDropdownWidget(),
            SizedBox(height: 16),
            StudentTabSemesterDropdownWidgets(),
            SizedBox(height: 16),
            StudentTabSubjectsDropdownWidget(),
            SizedBox(height: 220),

            RoundButton(title: "Show",
                height: 45,
                width: 200,
                onPress: () {
               Get.to(FetchingStudentScreen());
            }
            )
          ],
        ),
      ),

    );
  }
}
