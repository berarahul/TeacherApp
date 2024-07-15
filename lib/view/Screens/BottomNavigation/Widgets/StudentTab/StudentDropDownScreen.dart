import 'package:attendence/view_model/services/custom_Loading_service/customLoadingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/res/components/roundButton.dart';
import 'package:attendence/view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropdownWidgets/Widgets/student_tile.dart';
import '../../../../../view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../../../../view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
import '../../../../../view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/selectedSubjectIdStore.dart';
import '../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTileController.dart';
import 'StudentDropdownWidgets/Widgets/DepartmentDropdown.dart';
import 'StudentDropdownWidgets/Widgets/SemesterDropDown.dart';
import 'StudentDropdownWidgets/Widgets/SubjectDropdown.dart';

class Studentdropdownscreen extends StatelessWidget {
  final ApiHelper apiHelper = ApiHelper();
  final StudentTabSelectedDepartmentIdStore departmentIdStore = StudentTabSelectedDepartmentIdStore();
  final StudentTabSelectedSubjectIdStore subjectIdStore = StudentTabSelectedSubjectIdStore();
  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appcolor,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Students')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              StudentTabDepartmentDropdownWidget(),
              SizedBox(height: 16),
              StudentTabSemesterDropdownWidget(),
              SizedBox(height: 16),
              StudentTabSubjectsDropdownWidget(),
              SizedBox(height: 220),
              RoundButton(
                title: "Show",
                height: 45,
                width: 200,
                onPress: () async {
                  print("department id: ${departmentIdStore.selectedDepartmentId}");
                  print("subject id: ${subjectIdStore.selectedSubjectId}");

                  if (departmentIdStore.selectedDepartmentId == 0 || subjectIdStore.selectedSubjectId == 0) {
                    Get.snackbar(
                      'Selection Required',
                      'Please select all dropdown items',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  try {
                    LoadingController.showLoading();
                    studentController.resetState();
                    // Reset the state
                    var headers = await apiHelper.getHeaders();
                    await studentController.fetchStudentsAttendance();
                    // Fetch new data

                    Get.to(
                      FetchingStudentScreen(),
                      arguments: headers,
                    );
                  } catch (e) {
                    print('Error getting headers: $e');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
