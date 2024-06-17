import 'dart:developer';

import 'package:attendence/local_storage/my_storage_controller.dart';
import 'package:attendence/utils/logging/logger.dart';
import 'package:attendence/view/Screens/constant/Custom_Loading_widgets.dart';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Taken_Attendence/controllers/AttandanceTakenScreenController.dart';
import 'package:attendence/view_model/services/custom_Loading_service/customLoadingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';
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





  @override
  Widget build(BuildContext context) {
    RxList<DepartmentModel> departmentModels = departmentController.departments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Department:'),
            DepartmentDropdownWidget(
              key: UniqueKey(),
              departments: departmentModels,
              onChanged: (DepartmentModel? value) async {
                if (value != null) {
                  selectedDepartmentIdStore.selectedDepartmentId = value.id;
                  print(
                      "Selected Department id::${selectedDepartmentIdStore.selectedDepartmentId}");
                  print(selectedDepartmentIdStore.toString());



                  // semesterWithSubjectsController.selectedSubject.value = null;
                  await semesterWithSubjectsController.fetchSemesterSubjects();

                  // await departmentController.fetchDepartments();
                }
              },
            ),
            const SizedBox(height: 20),
            const Text('Select Semesters:'),
            Obx(() {
              var semesterSubjectsMap =
                  semesterWithSubjectsController.semesterSubjectMap;
              return SemesterDropdownWidget(
                key: UniqueKey(),
                semesterSubjectsMap: semesterSubjectsMap.value,
                onChanged: (int? value) {
                  if (value != null) {
                    selectedSemesterIdStore.SelectedSemesterId = value;
                    print(
                        "selected semester id::${selectedSemesterIdStore.SelectedSemesterId}");
                    print(selectedSemesterIdStore.toString());
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
            const Text('Select Subject:'),
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
                    print(
                        "selected subject id::${selectedSubjectIdStore.SelectedSubjectId}");
                    print(selectedSubjectIdStore.toString());
                    semesterWithSubjectsController.setSelectedSubject(newValue);
                  }
                },
              );
            }),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                  title: 'Submit',
                  onPress: ()  async {

                    final AttendanceController attendanceController = Get.put(AttendanceController());
                    log("Submit button pressed. studentflag: ${attendanceController.studentflag.value}");

                    // Reset the state before fetching new data
                    attendanceController.resetState();

                    // Show loading
                    LoadingController.showLoading();

                    // Using Future.delayed for a 2-second delay
                    await Future.delayed(Duration(seconds: 2));

                    // Fetch students
                    await attendanceController.fetchStudents();

                    // Navigate based on the flag value
                    if (attendanceController.studentflag.value) {
                      log("Navigating to AttendanceTakenScreen");
                      Get.to(() => AttendanceTakenScreen());
                    } else {
                      log("Students not fetched yet or some issue occurred.");
                      // Show an error or handle the state accordingly
                    }

                    // Hide loading
                    LoadingController.hideLoading();

                  },

                  height: 45,
                  width: 160,
                  buttonColor: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







