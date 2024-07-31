// import 'dart:convert';
// import 'package:attendence/res/AppUrl/AppUrl.dart';
// import 'package:attendence/res/Colors/AppColors.dart';
// import 'package:attendence/view/Screens/constant/SundayScreen.dart';
// import 'package:attendence/view/Screens/constant/dataNotfoundScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/attandancesubmitcontroller.dart';
// import '../../../../../view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
// import '../../../constant/AttendanceSuccessFully.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../constant/DontHaveClass.dart';
//
// class AttendanceTakenScreen extends StatelessWidget {
//   final AttendanceController controller = Get.put(AttendanceController());
//   final AttendanceSubmitController submitController = Get.put(AttendanceSubmitController());
//   List<int> selectedRollNumbers = [];
//
//   Future<bool> handleSubmit() async {
//     // Gather data
//     int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
//     int semesterId = SelectedSemesterIdStore().SelectedSemesterId;
//     int subjectId = SelectedSubjectIdStore().SelectedSubjectId;
//     List<int> rolls = selectedRollNumbers;
//
//     Map<String, dynamic> data = {
//       "deptId": departmentId,
//       "semId": semesterId,
//       "subjectId": subjectId,
//       "rolls": rolls
//     };
//
//     // Convert data to JSON string
//     String jsonData = jsonEncode(data);
//
//     // Prepare headers using ApiHelper
//     ApiHelper apiHelper = ApiHelper();
//     Map<String, String> headers;
//     try {
//       headers = await apiHelper.getHeaders();
//     } catch (e) {
//       print('Error getting headers: $e');
//       return false;
//     }
//
//     try {
//       var url = Uri.parse(AppUrl.takeAttendanceDataAPiUrl); // Get URL from AppUrl class
//       var response = await http.post(
//         url,
//         headers: headers,
//         body: jsonData,
//       );
//
//       print("Response status code: ${response.statusCode}");
//       print("Response body: ${response.body}");
//
//       if (response.statusCode == 201) {
//         print("Submission successful");
//         return true;
//       } else if (response.statusCode == 400) {
//         print("Submission failed with status code: ${response.statusCode}");
//         return false;
//       }else if (response.statusCode == 404) {
//         print("Submission failed with status code: ${response.statusCode}");
//           Get.to(NoClassScreen());
//         return false;
//       }
//       else if (response.statusCode == 403) {
//         print("Submission failed with status code: ${response.statusCode}");
//         Get.to(SundayScreen());
//         return false;
//       }
//
//
//       else {
//         print("Submission failed with status code: ${response.statusCode}");
//         return false;
//       }
//     } catch (e) {
//       print('Error: $e');
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Attendance')),
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.appcolor,
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: controller.students.length,
//           itemBuilder: (_, index) {
//             return ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: AppColors.appcolor,
//                 child: Icon(controller.students[index].isPresent
//                     ? Icons.check
//                     : Icons.close),
//               ),
//               title: Text(controller.students[index].name),
//               subtitle: Text('Roll No: ${controller.students[index].rollNumber}'),
//               trailing: Obx(() =>
//                   Checkbox(
//                     value: controller.students[index].isPresent,
//                     onChanged: (bool? value) {
//                       controller.toggleAttendance(index);
//
//                       if (value != null && value) {
//                         selectedRollNumbers.add(controller.students[index].rollNumber);
//                       } else {
//                         selectedRollNumbers.remove(controller.students[index].rollNumber);
//                       }
//                     },
//                     activeColor: AppColors.appcolor,
//                   )),
//             );
//           },
//         );
//       }),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Obx(() {
//             return TextButton(
//               onPressed: submitController.isSubmitting.value ? null : () async {
//                 if (submitController.isSubmitting.value)
//                   return; // Prevent duplicate calls
//                 submitController.setSubmitting(true);
//                 print("Submit button pressed");
//                 bool success = await handleSubmit();
//                 print("Submission result: $success");
//                 if (success) {
//                   print("Navigating to AttendanceSuccessFully screen");
//                   Get.to(() => Attendancesuccessfully());
//                 } else {
//                   print("Navigating to DataNotFoundScreen");
//                   Get.to(() => DataNotFoundScreen());
//                 }
//                 submitController.setSubmitting(false);
//               },
//               child: submitController.isSubmitting.value
//                   ? SizedBox(
//                 height: 24.0,
//                 width: 24.0,
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 ),
//               )
//                   : Text('Submit'),
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: AppColors.appcolor,
//                 disabledForegroundColor: Colors.grey.withOpacity(0.38),
//                 padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }


//
// import 'dart:convert';
// import 'package:attendence/res/AppUrl/AppUrl.dart';
// import 'package:attendence/res/Colors/AppColors.dart';
// import 'package:attendence/view/Screens/constant/dataNotfoundScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/attandancesubmitcontroller.dart';
// import '../../../../../view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
// import '../../../constant/AttendanceSuccessFully.dart';
//
// class AttendanceTakenScreen extends StatelessWidget {
//   final AttendanceController controller = Get.put(AttendanceController());
//   final AttendanceSubmitController submitController = Get.put(AttendanceSubmitController());
//   List<int> selectedRollNumbers = [];
//
//   Future<bool> handleSubmit() async {
//     int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
//     int semesterId = SelectedSemesterIdStore().SelectedSemesterId;
//     int subjectId = SelectedSubjectIdStore().SelectedSubjectId;
//     List<int> rolls = selectedRollNumbers;
//
//     Map<String, dynamic> data = {
//       "deptId": departmentId,
//       "semId": semesterId,
//       "subjectId": subjectId,
//       "rolls": rolls
//     };
//
//     String jsonData = jsonEncode(data);
//
//     ApiHelper apiHelper = ApiHelper();
//     Map<String, String> headers;
//     try {
//       headers = await apiHelper.getHeaders();
//     } catch (e) {
//       print('Error getting headers: $e');
//       return false;
//     }
//
//     try {
//       var url = Uri.parse(AppUrl.takeAttendanceDataAPiUrl); // URL to take attendance
//       var response = await http.post(
//         url,
//         headers: headers,
//         body: jsonData,
//       );
//
//       print("Submit attendance response status code: ${response.statusCode}");
//       print("Submit attendance response body: ${response.body}");
//
//       if (response.statusCode == 201) {
//         var responseData = jsonDecode(response.body);
//         if (responseData['statusMsg'] != null &&
//             responseData['statusMsg'].toString().contains('Attendance created successfully')) {
//           print("Submission successful");
//           return true;
//         } else {
//           print("Submission failed: Unexpected response");
//           return false;
//         }
//       } else if (response.statusCode == 400) {
//         print("Attendance already taken, navigating to DataNotFoundScreen");
//         return false;
//       } else {
//         print("Submission failed with status code: ${response.statusCode}");
//         return false;
//       }
//     } catch (e) {
//       print('Error: $e');
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Attendance')),
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColors.appcolor,
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: controller.students.length,
//           itemBuilder: (_, index) {
//             return ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: AppColors.appcolor,
//                 child: Icon(controller.students[index].isPresent
//                     ? Icons.check
//                     : Icons.close),
//               ),
//               title: Text(controller.students[index].name),
//               subtitle: Text('Roll No: ${controller.students[index].rollNumber}'),
//               trailing: Obx(() => Checkbox(
//                 value: controller.students[index].isPresent,
//                 onChanged: (bool? value) {
//                   controller.toggleAttendance(index);
//
//                   if (value != null && value) {
//                     selectedRollNumbers.add(controller.students[index].rollNumber);
//                   } else {
//                     selectedRollNumbers.remove(controller.students[index].rollNumber);
//                   }
//                 },
//                 activeColor: AppColors.appcolor,
//               )),
//             );
//           },
//         );
//       }),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Obx(() {
//             return TextButton(
//               onPressed: submitController.isSubmitting.value ? null : () async {
//                 if (submitController.isSubmitting.value) return; // Prevent duplicate calls
//                 submitController.setSubmitting(true);
//                 print("Submit button pressed");
//
//                 bool success = await handleSubmit();
//                 print("Submission result: $success");
//                 if (success) {
//                   print("Navigating to AttendanceSuccessFully screen");
//                   Get.to(() => Attendancesuccessfully());
//                 } else {
//                   print("Navigating to DataNotFoundScreen");
//                   Get.to(() => DataNotFoundScreen());
//                 }
//                 submitController.setSubmitting(false);
//               },
//               child: submitController.isSubmitting.value
//                   ? SizedBox(
//                 height: 24.0,
//                 width: 24.0,
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 ),
//               )
//                   : Text('Submit'),
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: AppColors.appcolor,
//                 disabledForegroundColor: Colors.grey.withOpacity(0.38),
//                 padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }





import 'dart:convert';
import 'package:attendence/res/AppUrl/AppUrl.dart';
import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/view/Screens/constant/DontHaveClass.dart';
import 'package:attendence/view/Screens/constant/dataNotfoundScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/attandancesubmitcontroller.dart';
import '../../../../../view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../../constant/AttendanceSuccessFully.dart';
// Import NoClassScreen
import '../../../constant/SundayScreen.dart'; // Import SundayScreen

class AttendanceTakenScreen extends StatelessWidget {
  final AttendanceController controller = Get.put(AttendanceController());
  final AttendanceSubmitController submitController = Get.put(AttendanceSubmitController());
  List<int> selectedRollNumbers = [];

  Future<void> handleSubmit() async {
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

    String jsonData = jsonEncode(data);

    // Debug print to check the data being sent
    print("JSON Data being sent: $jsonData");


    ApiHelper apiHelper = ApiHelper();
    Map<String, String> headers;
    try {
      headers = await apiHelper.getHeaders();
    } catch (e) {
      print('Error getting headers: $e');
      Get.snackbar("Error", "Failed to get headers.");
      return;
    }

    try {
      var url = Uri.parse(AppUrl.takeAttendanceDataAPiUrl); // URL to take attendance
      print("Request URL: $url"); // Print the URL
      var response = await http.post(
        url,
        headers: headers,
        body: jsonData,

      );

      print("Submit attendance response status code: ${response.statusCode}");
      print("Submit attendance response body: ${response.body}");

      switch (response.statusCode) {
        case 201:
        // Directly navigate to the success screen as the server responds with an empty JSON object.
          print("Submission successful");
          Get.to(() => Attendancesuccessfully());
          break;
        case 400:
          print("Attendance already taken, navigating to DataNotFoundScreen");
          Get.to(() => DataNotFoundScreen());
          break;
        case 404:
          print("No class scheduled for today, navigating to NoClassScreen");
          Get.to(() => NoClassScreen());
          break;
        case 403:
          print("No classes on Sunday, navigating to SundayScreen");
          Get.to(() => SundayScreen());
          break;
        default:
          print("Submission failed with status code: ${response.statusCode}");
          Get.snackbar("Error", "Submission failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", "An error occurred while submitting attendance.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Attendance')),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appcolor,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (_, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.appcolor,
                child: Icon(controller.students[index].isPresent
                    ? Icons.check
                    : Icons.close),
              ),
              title: Text(controller.students[index].name),
              subtitle: Text('Roll No: ${controller.students[index].rollNumber}'),
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
                activeColor: AppColors.appcolor,
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
                if (submitController.isSubmitting.value) return; // Prevent duplicate calls
                submitController.setSubmitting(true);
                print("Submit button pressed");

                await handleSubmit();
                submitController.setSubmitting(false);
              },
              child: submitController.isSubmitting.value
                  ? SizedBox(
                height: 24.0,
                width: 24.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
                  : Text('Submit'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.appcolor,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
