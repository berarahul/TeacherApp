
import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';

import '../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';

class AppUrl {
  static const String baseurl = "https://attendancesystem-s1.onrender.com";

  static String get departmentApiUrl {
    String teacherId = Login_Storage_Helper.retrieveTeacherId() ??
        ""; // Get teacherId from Login_Storage_Helper
    return "$baseurl/api/teacher/$teacherId"; // Append teacherId to the departmentApiUrl
  }

  static String get semesterWithSubjectApiUrl {
    String teacherId = Login_Storage_Helper.retrieveTeacherId() ?? "";
    int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
    // Get teacherId from Login_Storage_Helper
    return "$baseurl/api/teacher/$teacherId/$departmentId";
    // Append teacherId and departmentId to the semesterApiUrl// Append teacherId to the departmentApiUrl
  }
static String  get StudentDataAPiUrl{

  int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
  SelectedSemesterIdStore semesterId=SelectedSemesterIdStore().SelectedSemesterId as SelectedSemesterIdStore;
  return "$baseurl/api/student/$departmentId/$semesterId";
}

}
