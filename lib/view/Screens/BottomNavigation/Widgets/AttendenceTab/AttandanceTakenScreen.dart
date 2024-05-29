import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';

class Attandancetakenscreen extends StatelessWidget {
  final AttendanceController controller = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (_, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Icon(controller.students[index].isPresent ? Icons.check : Icons.close),
              ),
              title: Text(controller.students[index].name),
              subtitle: Text('Roll No: ${controller.students[index].rollNumber}'),
              trailing: Checkbox(
                value: controller.students[index].isPresent,
                onChanged: (bool? value) {
                  controller.students[index].isPresent = value!;
                  controller.update(); // This will trigger the UI to update
                },
                activeColor: Colors.blue, // Set a contrasting color for the tick mark
              ),
            );
          },
        );
      }),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              // Handle submit action
            },
            child: Text('Submit'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor, disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
          ),
        ),
      ),
    );
  }
}