import 'dart:ffi';

import 'package:attendence/local_storage/my_storage_controller.dart';
import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_subject_id.dart';
import 'package:attendence/view_model/services/custom_Loading_service/customLoadingController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';

import '../../../../../repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';
import '../../../../../res/components/roundButton.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/DepartmentController.dart';
import '../../../../../view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';

import 'AttandanceTakenScreen.dart';
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
final SelectedSemesterIdStore selectedSemesterIdStore= SelectedSemesterIdStore();

final SelectedSubjectIdStore selectedSubjectIdStore= SelectedSubjectIdStore();
  final myStorage = Get.find<MyStorageController>();

  @override
  Widget build(BuildContext context) {
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
                key: UniqueKey(),
                departments: departmentModels,
                onChanged: (DepartmentModel? value) async {
                  if (value != null) {
                    selectedDepartmentIdStore.selectedDepartmentId = value.id;
                    print("Selected Department id::${selectedDepartmentIdStore.selectedDepartmentId}");
                    print(selectedDepartmentIdStore.toString());
                    semesterWithSubjectsController.selectedSemester.value =
                        ''; // Clear selected semester
                    semesterWithSubjectsController.selectedSubject.clear();
                    // semesterWithSubjectsController.selectedSubject.value =
                    //     []; // Clear selected subjects

                    await semesterWithSubjectsController
                        .fetchSemesterSubjects( );
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

                    selectedSemesterIdStore.SelectedSemesterId=value;
                    print("selected semester id::${selectedSemesterIdStore.SelectedSemesterId}");
                    print(selectedSemesterIdStore.toString());
                    semesterWithSubjectsController
                        .setSelectedSemester(value.toString());
                    semesterWithSubjectsController.selectedSubject.value =
                        [];

                    // Clear selected subjects

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
              var subjects = semesterWithSubjectsController.selectedSubject.value.obs;
              return SubjectDropdownWidget(
                key: UniqueKey(),
                subjects: subjects,

                onChanged: (Semesterwithsubjectmodel? newValue) {
                  if (newValue != null) {
                    selectedSubjectIdStore.SelectedSubjectId = newValue.subjectId;
                    print("selected subject id::${selectedSubjectIdStore.SelectedSubjectId}");
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
                  onPress: ()  {

                    LoadingController.showLoading();
                    Get.to(() => AttendanceTakenScreen());

                  },
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


