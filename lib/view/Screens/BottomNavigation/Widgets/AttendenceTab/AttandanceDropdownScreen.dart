import 'dart:developer';
import 'package:attendence/local_storage/my_storage_controller.dart';
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
  final DepartmentController departmentController =
      Get.put(DepartmentController());
  final SemesterWithSubjectsController semesterWithSubjectsController =
      Get.put(SemesterWithSubjectsController());
  final SelectedDepartmentIdStore selectedDepartmentIdStore =
      SelectedDepartmentIdStore();
  final SelectedSemesterIdStore selectedSemesterIdStore =
      SelectedSemesterIdStore();
  final SelectedSubjectIdStore selectedSubjectIdStore =
      SelectedSubjectIdStore();
  final myStorage = Get.find<MyStorageController>();
  final AttendanceDropDownScreenController attendancedropDownScreenController =
      Get.put(AttendanceDropDownScreenController());
  // Ensure this is only called once in your app
  final AttendanceController attendanceController = Get.put(
      AttendanceController());
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
            // const Text('Select Department:'),
            DepartmentDropdownWidget(
              key: UniqueKey(),
              departments: departmentModels,
              onChanged: (DepartmentModel? value) async {
                if (value != null) {
                  selectedDepartmentIdStore.selectedDepartmentId = value.id;
                  log("Selected Department id::${selectedDepartmentIdStore.selectedDepartmentId}");
                  await semesterWithSubjectsController.fetchSemesterSubjects();
                }
              },
            ),
            const SizedBox(height: 20),
            // const Text('Select Semesters:'),
            Obx(() {
              var semesterSubjectsMap =
                  semesterWithSubjectsController.semesterSubjectMap;
              return SemesterDropdownWidget(
                key: UniqueKey(),
                semesterSubjectsMap: semesterSubjectsMap.value,
                onChanged: (int? value) {
                  if (value != null) {
                    selectedSemesterIdStore.SelectedSemesterId = value;
                    log("Selected semester id::${selectedSemesterIdStore.SelectedSemesterId}");
                    semesterWithSubjectsController
                        .setSelectedSemester(value.toString());
                    semesterWithSubjectsController.selectedSubject.value = null;
                    List<Semesterwithsubjectmodel> subjects =
                        semesterSubjectsMap[value] ?? [];
                    semesterWithSubjectsController.updateSubjects(subjects);
                  }
                },
              );
            }),
            const SizedBox(height: 20),
            // const Text('Select Subject:'),
            Obx(() {
              int selectedSemesterId = int.parse(
                  semesterWithSubjectsController.selectedSemester.value);
              RxList<Semesterwithsubjectmodel> subjects =
                  RxList<Semesterwithsubjectmodel>(
                      semesterWithSubjectsController
                              .semesterSubjectMap[selectedSemesterId] ??
                          []);
              return SubjectDropdownWidget(
                key: UniqueKey(),
                subjects: subjects.value,
                selectedSubject: semesterWithSubjectsController.selectedSubject,
                onChanged: (Semesterwithsubjectmodel? newValue) {
                  if (newValue != null) {
                    selectedSubjectIdStore.SelectedSubjectId =
                        newValue.subjectId;
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
                  return RoundButton(
                    title: 'Submit',

                    loading: attendancedropDownScreenController.isLoading.value,

                    onPress: () async {

                      attendancedropDownScreenController.setLoading(true);

                      log("Submit button pressed. Students list length: ${attendanceController.students.length}");

                      // Reset state before fetching students
                      attendanceController.resetState();

                      // Fetch students
                      await attendanceController.fetchStudents();

                      // Check if students are fetched
                      if (attendanceController.students.isNotEmpty) {
                        log("Navigating to AttendanceTakenScreen");
                        Get.to(() => AttendanceTakenScreen());
                      } else {
                        log("Students not fetched yet or some issue occurred.");
                      }

                      attendancedropDownScreenController.setLoading(false);
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
