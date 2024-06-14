import 'package:attendence/res/AppUrl/AppUrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
import '../../../constant/AttendanceSuccessFully.dart';

  class AttendanceTakenScreen extends StatelessWidget {
  final AttendanceController controller = Get.put(AttendanceController());
  List<int> selectedRollNumbers = [];

  void handleSubmit() async {
    // Gather data
    int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
    int semesterId = SelectedSemesterIdStore().SelectedSemesterId;
    int subjectId = SelectedSubjectIdStore().SelectedSubjectId;

    Map<String, dynamic> data = {
      "deptId": departmentId,
      "semId": semesterId,
      "subjectId": subjectId,
      "rolls": selectedRollNumbers
    };

    // Get the API URL
    String apiUrl = AppUrl.takeAttendanceDataAPiUrl;
    print(apiUrl);

    // Call the API to submit the data
    try {
      var response = await AttendanceDropDownRepository.takeAttendanceData(data);
      print(response);
      // Handle success, show message or navigate
    } catch (e) {
      // Handle error, show message
      print('Error: $e');
    }
  }


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
                child: Icon(controller.students[index].isPresent
                    ? Icons.check
                    : Icons.close),
              ),
              title: Text(controller.students[index].name),
              subtitle:
              Text('Roll No: ${controller.students[index].rollNumber}'),
              trailing: Obx(() => Checkbox(
                value: controller.students[index].isPresent,
                onChanged: (bool? value) {
                  controller.toggleAttendance(index);

                  if (value != null && value) {
                    selectedRollNumbers.add(controller.students[index].rollNumber);
                  } else {
                    selectedRollNumbers.remove(controller.students[index].rollNumber);
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
          child: TextButton(
            onPressed: ()  {
              // Handle submit action
              handleSubmit();
              Get.to(Attendancesuccessfully());
            },
            child: Text('Submit'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
          ),
        ),
      ),
    );


  }
}
