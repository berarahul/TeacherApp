// import 'dart:developer';
// import 'package:attendence/models/for_attandance_tab/SubjectModel.dart';
// import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SubjectController.dart';
// import 'package:attendence/view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
// import '../../../../../view_model/services/AttendenceTabServices/ForRoutine/RoutineScreenController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/AttendanceDropDownScreenController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterController.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
// import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
// import '../../../../../res/components/roundButton.dart';
// import '../../../../../res/Colors/AppColors.dart';
// import 'AttendanceDropdownWidgets/Widgets/DepartmentDropdown.dart';
// import 'AttandanceTakenScreen.dart';
// import 'AttendanceDropdownWidgets/Widgets/TeacherWiseRoutine.dart';
//
// class AttendanceDropDownScreen extends StatelessWidget {
//   final DepartmentController departmentController = Get.put(DepartmentController());
//  final SemestreController SemesterController = Get.put(SemestreController());
//  final SubjectController subjectController = Get.put(SubjectController());
//   final SelectedDepartmentIdStore selectedDepartmentIdStore = SelectedDepartmentIdStore();
//   final SelectedSemesterIdStore selectedSemesterIdStore = SelectedSemesterIdStore();
//   final SelectedSubjectIdStore selectedSubjectIdStore = SelectedSubjectIdStore();
//   final AttendanceDropDownScreenController attendancedropDownScreenController = Get.put(AttendanceDropDownScreenController());
//   final AttendanceController attendanceController = Get.put(AttendanceController());
//   final ScheduleController scheduleController = Get.put(ScheduleController());
//
//   AttendanceDropDownScreen() {
//     // Ensure the selected values are null when the screen is initialized
//     selectedDepartmentIdStore.selectedDepartmentId = null;
//     selectedSemesterIdStore.SelectedSemesterId = null;
//     selectedSubjectIdStore.SelectedSubjectId = null;
//     print("AttendanceDropDownScreen initialized with null values for selected IDs.");
//   }
//
//   bool _areDropdownsValid() {
//     bool isValid = selectedDepartmentIdStore.selectedDepartmentId != null &&
//         selectedSemesterIdStore.SelectedSemesterId != null &&
//         selectedSubjectIdStore.SelectedSubjectId != null;
//     print("Dropdowns valid check: $isValid");
//     print("Selected Department Id: ${selectedDepartmentIdStore.selectedDepartmentId}");
//     print("Selected Semester Id: ${selectedSemesterIdStore.SelectedSemesterId}");
//     print("Selected Subject Id: ${selectedSubjectIdStore.SelectedSubjectId}");
//     return isValid;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     RxList<DepartmentModel> departmentModels = departmentController.departments;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.appcolor,
//         automaticallyImplyLeading: false,
//         title: Center(child: const Text('Attendance')),
//       ),
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               DepartmentDropdownWidget(
//                 key: UniqueKey(),
//                 departments: departmentModels,
//                 onChanged: (DepartmentModel? value) async {
//                   print("DepartmentDropdownWidget onChanged called with value: $value");
//                   if (value != null) {
//
//                     selectedDepartmentIdStore.selectedDepartmentId = value.id;
//                     log("Selected Department id::${selectedDepartmentIdStore.selectedDepartmentId}");
//                     print("Fetching semester and subjects after selecting department ID: ${value.id}");
//                     await SemesterController.fetchSemester();
//
//                   }
//                 },
//               ),
//               const SizedBox(height: 20),
//
//
//           Obx(() {
//             if (SemesterController.fetchingSemesterList.isEmpty) {
//               return Container();
//             } else {
//               return DropdownButtonFormField<int>(
//                 items: [
//                   DropdownMenuItem<int>(
//                     value: null,
//                     child: Text('Select Semester'),
//                   ),
//                   ...SemesterController.fetchingSemesterList.map((int semesterId) {
//                     return DropdownMenuItem<int>(
//                       value: semesterId,
//                       child: Text('Semester $semesterId'), // Customize your label here
//                     );
//                   }).toList()
//                 ],
//                 onChanged: (value) {
//                   if (value != null) {
//                     SemesterController.setSemesterId(value);
//                     selectedSemesterIdStore.SelectedSemesterId = value;
//                     subjectController.fetchSubjects();
//                   }
//                 },
//                 decoration: const InputDecoration(
//                   labelText: 'Semester',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: SemesterController.semesterId.value == 0
//                     ? null
//                     : SemesterController.semesterId.value,
//               );
//             }
//           }),
//
//           const SizedBox(height: 20),
//
//               Obx(() {
//                 if (subjectController.subjectList.isEmpty) {
//                   return Container();
//                 } else {
//                   return DropdownButtonFormField<int>(
//                     items: subjectController.subjectList.map((SubjectModel subject) {
//                       return DropdownMenuItem<int>(
//                         value: subject.subjectId,
//                         child: Tooltip(
//                           message: subject.subjectName,
//                           child: Container(
//                             width: 200.0, // Set a fixed width
//                             child: Text(
//                               subject.subjectName,
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         subjectController.setSubjectId(value);
//                         selectedSubjectIdStore.SelectedSubjectId = value;
//
//                         // Show Snackbar with the full subject name
//                         var selectedSubject = subjectController.subjectList.firstWhere(
//                                 (subject) => subject.subjectId == value
//                         );
//                         Get.snackbar(
//                           'Selected Subject',
//                           selectedSubject.subjectName,
//                           snackPosition: SnackPosition.TOP,
//                           duration: Duration(seconds: 3),
//                         );
//                       }
//                       subjectController.toggleDropdown(false);
//                     },
//                     onTap: () {
//                       subjectController.toggleDropdown(true);
//                     },
//                     decoration: const InputDecoration(
//                       labelText: 'Subject',
//                       border: OutlineInputBorder(),
//                     ),
//                     value: subjectController.subjectId.value == 0
//                         ? null
//                         : subjectController.subjectId.value,
//                     selectedItemBuilder: (BuildContext context) {
//                       return subjectController.subjectList.map<Widget>((SubjectModel subject) {
//                         return Tooltip(
//                           message: subject.subjectName,
//                           child: Container(
//                             width: 200.0, // Set a fixed width
//                             child: Text(
//                               subject.subjectId == subjectController.subjectId.value
//                                   ? subject.subjectName
//                                   : subject.subjectName,
//                               overflow: subjectController.isDropdownOpened.value ? TextOverflow.visible : TextOverflow.ellipsis,
//                               maxLines: 1,
//                             ),
//                           ),
//                         );
//                       }).toList();
//                     },
//                   );
//                 }
//               }),
//
//               const SizedBox(height: 258),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Obx(() {
//                     print("RoundButton updated with loading state: ${attendancedropDownScreenController.isLoading.value}");
//                     return RoundButton(
//                       title: 'Submit',
//
//
//                       loading: attendancedropDownScreenController.isLoading.value,
//                       // Inside onPressed of RoundButton widget
//                       onPress: () async {
//                         print("Submit button pressed.");
//                         if (!_areDropdownsValid()) {
//                           // Show Snackbar if dropdowns are not selected
//                           Get.snackbar(
//                             'Error',
//                             'Please select all dropdown items before submitting',
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: Colors.red,
//                             colorText: Colors.white,
//                           );
//                           print("Snackbar shown for incomplete dropdown selection.");
//                           return; // Return early to prevent API call
//                         }
//
//                         attendancedropDownScreenController.setLoading(true);
//                         print("Loading state set to true.");
//
//                         try {
//                           // Reset state before fetching students
//                           attendanceController.resetState();
//                           print("AttendanceController state reset.");
//
//                           // Fetch students
//                           await attendanceController.fetchStudents();
//                           print("Students fetched: ${attendanceController.students}");
//
//                           // Check if students are fetched
//                           if (attendanceController.students.isNotEmpty) {
//                             log("Navigating to AttendanceTakenScreen");
//                             print("Navigating to AttendanceTakenScreen with students data.");
//                             Get.to(() => AttendanceTakenScreen());
//                           } else {
//                             log("Students not fetched yet or some issue occurred.");
//                             print("No students fetched or some issue occurred.");
//                           }
//                         } catch (e) {
//                           log("Error fetching students: $e");
//                           print("Error fetching students: $e");
//                           Get.snackbar(
//                             'Error',
//                             'Failed to fetch students. Please try again.',
//                             snackPosition: SnackPosition.BOTTOM,
//                             backgroundColor: Colors.red,
//                             colorText: Colors.white,
//                           );
//                         } finally {
//                           attendancedropDownScreenController.setLoading(false);
//                           print("Loading state set to false.");
//                         }
//                       },
//                       height: 45,
//                       width: 200,
//                       // buttonColor: AppColors.appcolor,
//                     );
//                   }),
//
//                 ],
//               ),
//               SizedBox(height: 23,),
//               Center(
//                 child: RoundButton(
//                     height: 50,
//                     width: 200,
//
//                     loading: scheduleController.isLoading.value,
//                     textColor: Colors.white,
//
//                     title: "Check Routine", onPress:() async {
//                   scheduleController.isLoading(true);
//                  await  scheduleController.fetchAndSetSchedule();
//                   Get.to(ScheduleScreen());
//                   scheduleController.isLoading(false);
//
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//


import 'dart:developer';
import 'package:attendence/models/for_attandance_tab/SubjectModel.dart';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SubjectController.dart';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
<<<<<<< HEAD
import '../../../../../view_model/services/AttendenceTabServices/ForRoutine/RoutineScreenController.dart';
=======
>>>>>>> dfb3e6faf40997956022e5b50d9afe99178b9a7f
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/AttendanceDropDownScreenController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
import '../../../../../res/components/roundButton.dart';
import '../../../../../res/Colors/AppColors.dart';
import 'AttendanceDropdownWidgets/Widgets/DepartmentDropdown.dart';
import 'AttandanceTakenScreen.dart';
import 'AttendanceDropdownWidgets/Widgets/TeacherWiseRoutine.dart';

class AttendanceDropDownScreen extends StatelessWidget {
  final DepartmentController departmentController = Get.put(DepartmentController());
<<<<<<< HEAD
  final SemestreController semesterController = Get.put(SemestreController());
  final SubjectController subjectController = Get.put(SubjectController());
=======
 final SemestreController SemesterController = Get.put(SemestreController());
 final SubjectController subjectController = Get.put(SubjectController());
>>>>>>> dfb3e6faf40997956022e5b50d9afe99178b9a7f
  final SelectedDepartmentIdStore selectedDepartmentIdStore = SelectedDepartmentIdStore();
  final SelectedSemesterIdStore selectedSemesterIdStore = SelectedSemesterIdStore();
  final SelectedSubjectIdStore selectedSubjectIdStore = SelectedSubjectIdStore();
  final AttendanceDropDownScreenController attendancedropDownScreenController = Get.put(AttendanceDropDownScreenController());
  final AttendanceController attendanceController = Get.put(AttendanceController());
  final ScheduleController scheduleController = Get.put(ScheduleController());

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
        selectedSubjectIdStore.SelectedSubjectId != null &&
        selectedSubjectIdStore.SelectedSubjectId != 0; // Added validation for subject ID
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
        backgroundColor: AppColors.appcolor,
        automaticallyImplyLeading: false,
        title: Center(child: const Text('Attendance')),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
<<<<<<< HEAD
                    await semesterController.fetchSemester();
                    // Clear the semester and subject selections when department changes
                    selectedSemesterIdStore.SelectedSemesterId = null;
                    selectedSubjectIdStore.SelectedSubjectId = null;
=======
                    await SemesterController.fetchSemester();

>>>>>>> dfb3e6faf40997956022e5b50d9afe99178b9a7f
                  }
                },
              ),
              const SizedBox(height: 20),


          Obx(() {
            if (SemesterController.fetchingSemesterList.isEmpty) {
              return Container();
            } else {
              return DropdownButtonFormField<int>(
                items: [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text('Select Semester'),
                  ),
                  ...SemesterController.fetchingSemesterList.map((int semesterId) {
                    return DropdownMenuItem<int>(
                      value: semesterId,
                      child: Text('Semester $semesterId'), // Customize your label here
                    );
                  }).toList()
                ],
                onChanged: (value) {
                  if (value != null) {
                    SemesterController.setSemesterId(value);
                    selectedSemesterIdStore.SelectedSemesterId = value;
                    subjectController.fetchSubjects();
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Semester',
                  border: OutlineInputBorder(),
                ),
                value: SemesterController.semesterId.value == 0
                    ? null
                    : SemesterController.semesterId.value,
              );
            }
          }),




          const SizedBox(height: 20),

              Obx(() {
<<<<<<< HEAD
                if (semesterController.fetchingSemesterList.isEmpty) {
                  return Container();
                } else {
                  return DropdownButtonFormField<int>(
                    items: [
                      DropdownMenuItem<int>(
                        value: null,
                        child: Text('Select Semester'),
                      ),
                      ...semesterController.fetchingSemesterList.map((int semesterId) {
                        return DropdownMenuItem<int>(
                          value: semesterId,
                          child: Text('Semester $semesterId'), // Customize your label here
                        );
                      }).toList()
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        semesterController.setSemesterId(value);
                        selectedSemesterIdStore.SelectedSemesterId = value;
                        subjectController.fetchSubjects();
                        // Clear the subject selection when semester changes
                        selectedSubjectIdStore.SelectedSubjectId = null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Semester',
                      border: OutlineInputBorder(),
                    ),
                    value: semesterController.semesterId.value == 0
                        ? null
                        : semesterController.semesterId.value,
                  );
                }
              }),
              const SizedBox(height: 20),
              Obx(() {
=======
>>>>>>> dfb3e6faf40997956022e5b50d9afe99178b9a7f
                if (subjectController.subjectList.isEmpty) {
                  return Container();
                } else {
                  return DropdownButtonFormField<int>(
                    items: subjectController.subjectList.map((SubjectModel subject) {
                      return DropdownMenuItem<int>(
                        value: subject.subjectId,
                        child: Tooltip(
                          message: subject.subjectName,
                          child: Container(
                            width: 200.0, // Set a fixed width
                            child: Text(
                              subject.subjectName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        subjectController.setSubjectId(value);
                        selectedSubjectIdStore.SelectedSubjectId = value;
<<<<<<< HEAD
=======

                        // Show Snackbar with the full subject name
>>>>>>> dfb3e6faf40997956022e5b50d9afe99178b9a7f
                        var selectedSubject = subjectController.subjectList.firstWhere(
                                (subject) => subject.subjectId == value
                        );
                        Get.snackbar(
                          'Selected Subject',
                          selectedSubject.subjectName,
                          snackPosition: SnackPosition.TOP,
                          duration: Duration(seconds: 3),
                        );
                      }
                      subjectController.toggleDropdown(false);
                    },
                    onTap: () {
                      subjectController.toggleDropdown(true);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Subject',
                      border: OutlineInputBorder(),
                    ),
                    value: subjectController.subjectId.value == 0
                        ? null
                        : subjectController.subjectId.value,
                    selectedItemBuilder: (BuildContext context) {
                      return subjectController.subjectList.map<Widget>((SubjectModel subject) {
                        return Tooltip(
                          message: subject.subjectName,
                          child: Container(
                            width: 200.0, // Set a fixed width
                            child: Text(
                              subject.subjectId == subjectController.subjectId.value
                                  ? subject.subjectName
                                  : subject.subjectName,
                              overflow: subjectController.isDropdownOpened.value ? TextOverflow.visible : TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        );
                      }).toList();
                    },
                  );
                }
              }),




              const SizedBox(height: 258),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    print("RoundButton updated with loading state: ${attendancedropDownScreenController.isLoading.value}");
                    return RoundButton(
                      height: 50,
                      width: 200,
                      title: 'Submit',
                      loading: attendancedropDownScreenController.isLoading.value,
                      onPress: () async {
                        print("Submit button pressed.");
                        if (!_areDropdownsValid()) {
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

                        try {
                          attendanceController.resetState();
                          print("AttendanceController state reset.");
                          await attendanceController.fetchStudents();
                          print("Students fetched: ${attendanceController.students}");
                          if (attendanceController.students.isNotEmpty) {
                            Get.to(AttendanceTakenScreen());
                          } else {
                            Get.snackbar(
                              'Error',
                              'No students found for the selected department, semester, and subject',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            print("Snackbar shown for no students found.");
                          }
                        } catch (error) {
                          Get.snackbar(
                            'Error',
                            'An error occurred while fetching students',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          print("Error occurred: $error");
                        } finally {
                          attendancedropDownScreenController.setLoading(false);
                          print("Loading state set to false.");
                        }
                      },
                    );

                  }),


                ],
              ),
              SizedBox(height: 23,),
              Center(
                child: RoundButton(
                    height: 50,
                    width: 200,

                    loading: scheduleController.isLoading.value,
                    textColor: Colors.white,

                    title: "Check Routine", onPress:() async {
                  scheduleController.isLoading(true);
                  await  scheduleController.fetchAndSetSchedule();
                  Get.to(ScheduleScreen());
                  scheduleController.isLoading(false);

                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
