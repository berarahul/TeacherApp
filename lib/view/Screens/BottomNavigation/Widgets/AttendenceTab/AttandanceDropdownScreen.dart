// import 'dart:developer';
// import 'package:attendence/view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
// import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/AttendanceDropDownScreenController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
// import '../../../../../res/components/roundButton.dart';
// import '../../../../../res/Colors/AppColors.dart';
// import 'AttendanceDropdownWidgets/Widgets/DepartmentDropdown.dart';
// import 'AttendanceDropdownWidgets/Widgets/SemesterDropdown.dart';
// import 'AttendanceDropdownWidgets/Widgets/SubjectsDropdown.dart';
// import 'AttandanceTakenScreen.dart';
//
// class AttendanceDropDownScreen extends StatelessWidget {
//   final DepartmentController departmentController = Get.put(DepartmentController());
//   final SemesterWithSubjectsController semesterWithSubjectsController = Get.put(SemesterWithSubjectsController());
//   final SelectedDepartmentIdStore selectedDepartmentIdStore = SelectedDepartmentIdStore();
//   final SelectedSemesterIdStore selectedSemesterIdStore = SelectedSemesterIdStore();
//   final SelectedSubjectIdStore selectedSubjectIdStore = SelectedSubjectIdStore();
//   final AttendanceDropDownScreenController attendancedropDownScreenController = Get.put(AttendanceDropDownScreenController());
//   final AttendanceController attendanceController = Get.put(AttendanceController());
//
//   bool _areDropdownsValid() {
//     bool isValid = selectedDepartmentIdStore.selectedDepartmentId != null &&
//         selectedSemesterIdStore.SelectedSemesterId != null &&
//         selectedSubjectIdStore.SelectedSubjectId != null;
//     log("Dropdowns valid: $isValid");
//     log("Selected Department Id: ${selectedDepartmentIdStore.selectedDepartmentId}");
//     log("Selected Semester Id: ${selectedSemesterIdStore.SelectedSemesterId}");
//     log("Selected Subject Id: ${selectedSubjectIdStore.SelectedSubjectId}");
//     return isValid;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     RxList<DepartmentModel> departmentModels = departmentController.departments;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         automaticallyImplyLeading: false,
//         title: const Text('Attendance'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DepartmentDropdownWidget(
//               key: UniqueKey(),
//               departments: departmentModels,
//               onChanged: (DepartmentModel? value) async {
//                 if (value != null) {
//                   selectedDepartmentIdStore.selectedDepartmentId = value.id;
//                   log("Selected Department id::${selectedDepartmentIdStore.selectedDepartmentId}");
//                   await semesterWithSubjectsController.fetchSemesterSubjects();
//                 }
//               },
//             ),
//             const SizedBox(height: 20),
//             Obx(() {
//               var semesterSubjectsMap = semesterWithSubjectsController.semesterSubjectMap;
//               return SemesterDropdownWidget(
//                 key: UniqueKey(),
//                 semesterSubjectsMap: semesterSubjectsMap.value,
//                 onChanged: (int? value) {
//                   if (value != null) {
//                     selectedSemesterIdStore.SelectedSemesterId = value;
//                     log("Selected semester id::${selectedSemesterIdStore.SelectedSemesterId}");
//                     semesterWithSubjectsController.setSelectedSemester(value.toString());
//                     semesterWithSubjectsController.selectedSubject.value = null;
//                     List<Semesterwithsubjectmodel> subjects = semesterSubjectsMap[value] ?? [];
//                     semesterWithSubjectsController.updateSubjects(subjects);
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 20),
//             Obx(() {
//               int selectedSemesterId = int.parse(semesterWithSubjectsController.selectedSemester.value);
//               RxList<Semesterwithsubjectmodel> subjects = RxList<Semesterwithsubjectmodel>(semesterWithSubjectsController.semesterSubjectMap[selectedSemesterId] ?? []);
//               return SubjectDropdownWidget(
//                 key: UniqueKey(),
//                 subjects: subjects.value,
//                 selectedSubject: semesterWithSubjectsController.selectedSubject,
//                 onChanged: (Semesterwithsubjectmodel? newValue) {
//                   if (newValue != null) {
//                     selectedSubjectIdStore.SelectedSubjectId = newValue.subjectId;
//                     log("Selected subject id::${selectedSubjectIdStore.SelectedSubjectId}");
//                     semesterWithSubjectsController.setSelectedSubject(newValue);
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 258),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Obx(() {
//                   return RoundButton(
//                     title: 'Submit',
//                     loading: attendancedropDownScreenController.isLoading.value,
//                     onPress: () async {
//                       if (!_areDropdownsValid()) {
//                         // Show Snackbar if dropdowns are not selected
//                         Get.snackbar(
//                           'Error',
//                           'Please select all dropdown items before submitting',
//                           snackPosition: SnackPosition.BOTTOM,
//                           backgroundColor: Colors.red,
//                           colorText: Colors.white,
//                         );
//                         return; // Return early to prevent API call
//                       }
//
//                       attendancedropDownScreenController.setLoading(true);
//
//                       log("Submit button pressed. Students list length: ${attendanceController.students.length}");
//
//                       // Reset state before fetching students
//
//                       attendanceController.resetState();
//                       // Fetch students
//                       // selectedDepartmentIdStore.clearSelectedDepartmentId();
//                       // selectedSemesterIdStore.clearSelectedSemesterId();
//                       // selectedSubjectIdStore.clearSelectedSubjectId();
//
//                       await attendanceController.fetchStudents();
//
//
//                       // Check if students are fetched
//                       if (attendanceController.students.isNotEmpty) {
//                         log("Navigating to AttendanceTakenScreen");
//                         Get.to(() => AttendanceTakenScreen());
//                       } else {
//                         log("Students not fetched yet or some issue occurred.");
//                       }
//
//                       attendancedropDownScreenController.setLoading(false);
//                     },
//                     height: 45,
//                     width: 200,
//                     buttonColor: AppColors.primaryColor,
//                   );
//                 })
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//
// import 'dart:developer';
// import 'package:attendence/view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
// import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/AttendanceDropDownScreenController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
// import '../../../../../res/components/roundButton.dart';
// import '../../../../../res/Colors/AppColors.dart';
// import 'AttendanceDropdownWidgets/Widgets/DepartmentDropdown.dart';
// import 'AttendanceDropdownWidgets/Widgets/SemesterDropdown.dart';
// import 'AttendanceDropdownWidgets/Widgets/SubjectsDropdown.dart';
// import 'AttandanceTakenScreen.dart';
//
// class AttendanceDropDownScreen extends StatelessWidget {
//   final DepartmentController departmentController = Get.put(DepartmentController());
//   final SemesterWithSubjectsController semesterWithSubjectsController = Get.put(SemesterWithSubjectsController());
//   final SelectedDepartmentIdStore selectedDepartmentIdStore = SelectedDepartmentIdStore();
//   final SelectedSemesterIdStore selectedSemesterIdStore = SelectedSemesterIdStore();
//   final SelectedSubjectIdStore selectedSubjectIdStore = SelectedSubjectIdStore();
//   final AttendanceDropDownScreenController attendancedropDownScreenController = Get.put(AttendanceDropDownScreenController());
//   final AttendanceController attendanceController = Get.put(AttendanceController());
//
//   AttendanceDropDownScreen() {
//     // Ensure the selected values are null when the screen is initialized
//     selectedDepartmentIdStore.selectedDepartmentId = null;
//     selectedSemesterIdStore.SelectedSemesterId = null;
//     selectedSubjectIdStore.SelectedSubjectId = null;
//   }
//
//   bool _areDropdownsValid() {
//     bool isValid = selectedDepartmentIdStore.selectedDepartmentId != null &&
//         selectedSemesterIdStore.SelectedSemesterId != null &&
//         selectedSubjectIdStore.SelectedSubjectId != null;
//     log("Dropdowns valid: $isValid");
//     log("Selected Department Id: ${selectedDepartmentIdStore.selectedDepartmentId}");
//     log("Selected Semester Id: ${selectedSemesterIdStore.SelectedSemesterId}");
//     log("Selected Subject Id: ${selectedSubjectIdStore.SelectedSubjectId}");
//     return isValid;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     RxList<DepartmentModel> departmentModels = departmentController.departments;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         automaticallyImplyLeading: false,
//         title: const Text('Attendance'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DepartmentDropdownWidget(
//               key: UniqueKey(),
//               departments: departmentModels,
//               onChanged: (DepartmentModel? value) async {
//                 if (value != null) {
//                   selectedDepartmentIdStore.selectedDepartmentId = value.id;
//                   log("Selected Department id::${selectedDepartmentIdStore.selectedDepartmentId}");
//                   await semesterWithSubjectsController.fetchSemesterSubjects();
//                 }
//               },
//             ),
//             const SizedBox(height: 20),
//             Obx(() {
//               var semesterSubjectsMap = semesterWithSubjectsController.semesterSubjectMap;
//               return SemesterDropdownWidget(
//                 key: UniqueKey(),
//                 semesterSubjectsMap: semesterSubjectsMap.value,
//                 onChanged: (int? value) {
//                   if (value != null) {
//                     selectedSemesterIdStore.SelectedSemesterId = value;
//                     log("Selected semester id::${selectedSemesterIdStore.SelectedSemesterId}");
//                     semesterWithSubjectsController.setSelectedSemester(value.toString());
//                     semesterWithSubjectsController.selectedSubject.value = null;
//                     List<Semesterwithsubjectmodel> subjects = semesterSubjectsMap[value] ?? [];
//                     semesterWithSubjectsController.updateSubjects(subjects);
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 20),
//             Obx(() {
//               int selectedSemesterId = int.parse(semesterWithSubjectsController.selectedSemester.value);
//               RxList<Semesterwithsubjectmodel> subjects = RxList<Semesterwithsubjectmodel>(semesterWithSubjectsController.semesterSubjectMap[selectedSemesterId] ?? []);
//               return SubjectDropdownWidget(
//                 key: UniqueKey(),
//                 subjects: subjects.value,
//                 selectedSubject: semesterWithSubjectsController.selectedSubject,
//                 onChanged: (Semesterwithsubjectmodel? newValue) {
//                   if (newValue != null) {
//                     selectedSubjectIdStore.SelectedSubjectId = newValue.subjectId;
//                     log("Selected subject id::${selectedSubjectIdStore.SelectedSubjectId}");
//                     semesterWithSubjectsController.setSelectedSubject(newValue);
//                   }
//                 },
//               );
//             }),
//             const SizedBox(height: 258),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Obx(() {
//                   return RoundButton(
//                     title: 'Submit',
//                     loading: attendancedropDownScreenController.isLoading.value,
//                     onPress: () async {
//                       if (!_areDropdownsValid()) {
//                         // Show Snackbar if dropdowns are not selected
//                         Get.snackbar(
//                           'Error',
//                           'Please select all dropdown items before submitting',
//                           snackPosition: SnackPosition.BOTTOM,
//                           backgroundColor: Colors.red,
//                           colorText: Colors.white,
//                         );
//                         return; // Return early to prevent API call
//                       }
//
//                       attendancedropDownScreenController.setLoading(true);
//
//                       log("Submit button pressed. Students list length: ${attendanceController.students.length}");
//
//                       // Reset state before fetching students
//                       attendanceController.resetState();
//
//                       // Fetch students
//                       await attendanceController.fetchStudents();
//
//                       // Check if students are fetched
//                       if (attendanceController.students.isNotEmpty) {
//                         log("Navigating to AttendanceTakenScreen");
//                         Get.to(() => AttendanceTakenScreen());
//                       } else {
//                         log("Students not fetched yet or some issue occurred.");
//                       }
//
//                       attendancedropDownScreenController.setLoading(false);
//                     },
//                     height: 45,
//                     width: 200,
//                     buttonColor: AppColors.primaryColor,
//                   );
//                 })
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:developer';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/AttendanceDropDownScreenController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
import '../../../../../res/components/roundButton.dart';
import '../../../../../res/Colors/AppColors.dart';
import 'AttendanceDropdownWidgets/Widgets/DepartmentDropdown.dart';
import 'AttendanceDropdownWidgets/Widgets/SemesterDropdown.dart';
import 'AttendanceDropdownWidgets/Widgets/SubjectsDropdown.dart';
import 'AttandanceTakenScreen.dart';

class AttendanceDropDownScreen extends StatelessWidget {
  final DepartmentController departmentController = Get.put(DepartmentController());
  final SemesterWithSubjectsController semesterWithSubjectsController = Get.put(SemesterWithSubjectsController());
  final SelectedDepartmentIdStore selectedDepartmentIdStore = SelectedDepartmentIdStore();
  final SelectedSemesterIdStore selectedSemesterIdStore = SelectedSemesterIdStore();
  final SelectedSubjectIdStore selectedSubjectIdStore = SelectedSubjectIdStore();
  final AttendanceDropDownScreenController attendancedropDownScreenController = Get.put(AttendanceDropDownScreenController());
  final AttendanceController attendanceController = Get.put(AttendanceController());

  AttendanceDropDownScreen() {
    // Ensure the selected values are null when the screen is initialized
    selectedDepartmentIdStore.selectedDepartmentId = null;
    selectedSemesterIdStore.SelectedSemesterId = null;
    selectedSubjectIdStore.SelectedSubjectId = null;
    print("AttendanceDropDownScreen initialized with null values for selected IDs.");
  }

  bool _areDropdownsValid() {
    bool isValid = selectedDepartmentIdStore.selectedDepartmentId != null &&
        selectedSemesterIdStore.SelectedSemesterId != null &&
        selectedSubjectIdStore.SelectedSubjectId != null;
    print("Dropdowns valid check: $isValid");
    print("Selected Department Id: ${selectedDepartmentIdStore.selectedDepartmentId}");
    print("Selected Semester Id: ${selectedSemesterIdStore.SelectedSemesterId}");
    print("Selected Subject Id: ${selectedSubjectIdStore.SelectedSubjectId}");
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    RxList<DepartmentModel> departmentModels = departmentController.departments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: const Text('Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DepartmentDropdownWidget(
              key: UniqueKey(),
              departments: departmentModels,
              onChanged: (DepartmentModel? value) async {
                print("DepartmentDropdownWidget onChanged called with value: $value");
                if (value != null) {
                  selectedDepartmentIdStore.selectedDepartmentId = value.id;
                  log("Selected Department id::${selectedDepartmentIdStore.selectedDepartmentId}");
                  print("Fetching semester and subjects after selecting department ID: ${value.id}");
                  await semesterWithSubjectsController.fetchSemesterSubjects();
                }
              },
            ),
            const SizedBox(height: 20),
            Obx(() {
              var semesterSubjectsMap = semesterWithSubjectsController.semesterSubjectMap;
              print("SemesterDropdownWidget updated with semesterSubjectsMap: ${semesterSubjectsMap.value}");
              return SemesterDropdownWidget(
                key: UniqueKey(),
                semesterSubjectsMap: semesterSubjectsMap.value,
                onChanged: (int? value) {
                  print("SemesterDropdownWidget onChanged called with value: $value");
                  if (value != null) {
                    selectedSemesterIdStore.SelectedSemesterId = value;
                    log("Selected semester id::${selectedSemesterIdStore.SelectedSemesterId}");
                    semesterWithSubjectsController.setSelectedSemester(value.toString());
                    semesterWithSubjectsController.selectedSubject.value = null;
                    List<Semesterwithsubjectmodel> subjects = semesterSubjectsMap[value] ?? [];
                    print("Updating subjects for selected semester ID: $value with subjects: $subjects");
                    semesterWithSubjectsController.updateSubjects(subjects);
                  }
                },
              );
            }),
            const SizedBox(height: 20),
            Obx(() {
              int selectedSemesterId = int.parse(semesterWithSubjectsController.selectedSemester.value);
              RxList<Semesterwithsubjectmodel> subjects = RxList<Semesterwithsubjectmodel>(semesterWithSubjectsController.semesterSubjectMap[selectedSemesterId] ?? []);
              print("SubjectDropdownWidget updated with subjects for selectedSemesterId: $selectedSemesterId");
              return SubjectDropdownWidget(
                key: UniqueKey(),
                subjects: subjects.value,
                selectedSubject: semesterWithSubjectsController.selectedSubject,
                onChanged: (Semesterwithsubjectmodel? newValue) {
                  print("SubjectDropdownWidget onChanged called with value: $newValue");
                  if (newValue != null) {
                    selectedSubjectIdStore.SelectedSubjectId = newValue.subjectId;
                    log("Selected subject id::${selectedSubjectIdStore.SelectedSubjectId}");
                    semesterWithSubjectsController.setSelectedSubject(newValue);
                  }
                },
              );
            }),
            const SizedBox(height: 258),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  print("RoundButton updated with loading state: ${attendancedropDownScreenController.isLoading.value}");
                  return RoundButton(
                    title: 'Submit',
                    loading: attendancedropDownScreenController.isLoading.value,
                    onPress: () async {
                      print("Submit button pressed.");
                      if (!_areDropdownsValid()) {
                        // Show Snackbar if dropdowns are not selected
                        Get.snackbar(
                          'Error',
                          'Please select all dropdown items before submitting',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        print("Snackbar shown for incomplete dropdown selection.");
                        return; // Return early to prevent API call
                      }

                      attendancedropDownScreenController.setLoading(true);
                      print("Loading state set to true.");

                      log("Submit button pressed. Students list length: ${attendanceController.students.length}");

                      // Reset state before fetching students
                      attendanceController.resetState();
                      print("AttendanceController state reset.");

                      // Fetch students
                      await attendanceController.fetchStudents();
                      print("Students fetched: ${attendanceController.students}");

                      // Check if students are fetched
                      if (attendanceController.students.isNotEmpty) {
                        log("Navigating to AttendanceTakenScreen");
                        print("Navigating to AttendanceTakenScreen with students data.");
                        Get.to(() => AttendanceTakenScreen());
                      } else {
                        log("Students not fetched yet or some issue occurred.");
                        print("No students fetched or some issue occurred.");
                      }

                      attendancedropDownScreenController.setLoading(false);
                      print("Loading state set to false.");
                    },
                    height: 45,
                    width: 200,
                    buttonColor: AppColors.primaryColor,
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
