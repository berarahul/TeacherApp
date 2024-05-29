import 'dart:ffi';

import 'package:attendence/res/Colors/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../models/for_attandance_tab/DepartmentModel.dart';

import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

import '../../../../../res/components/roundButton.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';

import 'AttendanceDropdownWidgets/Widgets/DepartmentDropdown.dart';
import 'AttendanceDropdownWidgets/Widgets/SemesterDropdown.dart';
import 'AttendanceDropdownWidgets/Widgets/SubjectsDropdown.dart';

class AttendanceDropDownScreen extends StatelessWidget {
  final DepartmentController departmentController =
      Get.put(DepartmentController());
  final SemesterWithSubjectsController semesterWithSubjectsController =
      Get.put(SemesterWithSubjectsController());

  final SelectedDepartmentIdStore selectedDepartmentIdStore =
      SelectedDepartmentIdStore();

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
            Obx(() {
              RxList<DepartmentModel> departmentModels =
                  departmentController.departments.value.obs;
              return DepartmentDropdownWidget(
                departments: departmentModels,
                onChanged: (DepartmentModel? value) async {
                  // Handle department selection here
                  if (value != null) {
                    // Store the selected department ID
                    selectedDepartmentIdStore.selectedDepartmentId = value.id;
                    print(
                        'selected Department id: ${selectedDepartmentIdStore.selectedDepartmentId}');

                    await semesterWithSubjectsController
                        .fetchSemesterSubjects();
                    print("hi i am here");
                  }
                },
              );
            }),
            const SizedBox(height: 20),
            const Text('Select Semesters:'),
            Obx(() {
              var semesterSubjectsMap =
                  semesterWithSubjectsController.semesterSubjectMap.value.obs;
              return SemesterDropdownWidget(
                key: UniqueKey(),
                semesterSubjectsMap: semesterSubjectsMap,
                onChanged: (int? value) {
                  if (value != null) {
                    semesterWithSubjectsController
                        .setSelectedSemester(value.toString());
                    // Update subjects dropdown based on selected semester
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
              var subjects =
                  semesterWithSubjectsController.selectedSubject.value.obs;
              return SubjectDropdownWidget(
                key: UniqueKey(),
                subjects: subjects, // No need to wrap in obs here
                onChanged: (Semesterwithsubjectmodel? newValue) {
                  if (newValue != null) {
                    // Handle subject selection here
                    semesterWithSubjectsController
                        .setSelectedSubject(newValue.subjectName);
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
                  onPress: () {},
                  height: 45,
                  width: 160,
                  buttonColor: AppColors.primaryColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
