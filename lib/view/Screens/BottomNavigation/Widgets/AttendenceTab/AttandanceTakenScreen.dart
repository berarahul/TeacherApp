import 'dart:convert';

import 'package:attendence/res/AppUrl/AppUrl.dart';
import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/view/Screens/constant/dataNotfoundScreen.dart';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/attandancesubmitcontroller.dart';
import '../../../../../view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../../constant/AttendanceSuccessFully.dart';
import 'package:http/http.dart' as http;
class AttendanceTakenScreen extends StatelessWidget {
  final AttendanceController controller = Get.put(AttendanceController());
  final AttendanceSubmitController submitController = Get.put(
      AttendanceSubmitController());
  List<int> selectedRollNumbers = [];

  Future<bool> handleSubmit() async {
    // Gather data
    int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
    int semesterId = SelectedSemesterIdStore().SelectedSemesterId;
    int subjectId = SelectedSubjectIdStore().SelectedSubjectId;
    List<int> rolls = selectedRollNumbers;

    Map<String, dynamic> data = {
      "deptId": departmentId,
      "semId": semesterId,
      "subjectId": subjectId,
      "rolls": rolls
    };

    // Convert data to JSON string
    String jsonData = jsonEncode(data);

    // Prepare headers using ApiHelper
    ApiHelper apiHelper = ApiHelper();
    Map<String, String> headers;
    try {
      headers = await apiHelper.getHeaders();
    } catch (e) {
      print('Error getting headers: $e');
      return false;
    }

    try {
      var url = Uri.parse(AppUrl.takeAttendanceDataAPiUrl); // Get URL from AppUrl class
      var response = await http.post(
        url,
        headers: headers,
        body: jsonData,
      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        if (responseData['statusMsg'] != null &&
            responseData['statusMsg'].toString().contains('Attendance created successfully')) {
          print("Submission successful");
          return true;
        } else {
          print("Submission failed: Unexpected response");
          return false;
        }
      } else {
        print("Submission failed with status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
          automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (_, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Icon(controller.students[index].isPresent
                    ? Icons.check
                    : Icons.close),
              ),
              title: Text(controller.students[index].name),
              subtitle:
              Text('Roll No: ${controller.students[index].rollNumber}'),
              trailing: Obx(() =>
                  Checkbox(
                    value: controller.students[index].isPresent,
                    onChanged: (bool? value) {
                      controller.toggleAttendance(index);

                      if (value != null && value) {
                        selectedRollNumbers.add(
                            controller.students[index].rollNumber);
                      } else {
                        selectedRollNumbers.remove(
                            controller.students[index].rollNumber);
                      }
                    },
                    activeColor: Colors.blue,
                  )),
            );
          },
        );
      }),


      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Obx(() {
            return TextButton(
              onPressed: submitController.isSubmitting.value ? null : () async {
                if (submitController.isSubmitting.value)
                  return; // Prevent duplicate calls
                submitController.setSubmitting(true);
                print("Submit button pressed");
                bool success = await handleSubmit();
                print("Submission result: $success");
                if (success) {
                  print("Navigating to AttendanceSuccessFully screen");
                  Get.to(() => Attendancesuccessfully());
                } else {
                  print("Navigating to DataNotFoundScreen");
                  Get.to(() => DataNotFoundScreen());
                }
                submitController.setSubmitting(false);
              },
              child: submitController.isSubmitting.value
                  ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : Text('Submit'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
            );
          }),
        ),
      ),
    );
  }
}


