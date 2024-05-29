import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/StudentdropdownscreenController.dart';

class Studentdropdownscreen extends StatelessWidget {
  final StudentdropdownscreenController controller = Get.put(StudentdropdownscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: Text('Choose Department'),
              value: controller.selectedDepartment.value.isNotEmpty ? controller.selectedDepartment.value : null,
              onChanged: (newValue) {
                controller.selectedDepartment.value = newValue!;
              },
              items: controller.departments.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: Text('Choose Semester'),
              value: controller.selectedSemester.value.isNotEmpty ? controller.selectedSemester.value : null,
              onChanged: (newValue) {
                controller.selectedSemester.value = newValue!;
              },
              items: controller.semesters.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: Text('Choose Subject'),
              value: controller.selectedSubject.value.isNotEmpty ? controller.selectedSubject.value : null,
              onChanged: (newValue) {
                controller.selectedSubject.value = newValue!;
              },
              items: controller.subjects.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                controller.submit();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}