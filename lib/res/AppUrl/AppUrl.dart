import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/selected_semesterid_store.dart';
import 'package:attendence/view_model/services/StudentTabServices/ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
import '../../view_model/services/AttendenceTabServices/for_Dropdown/Attendence_DropDown_Helper_Function/Selected_Department_Id_store.dart';
import '../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
class AppUrl {
  static const String baseurl = "https://attendancesystem-s1.onrender.com";
  static String get departmentApiUrl {
    int? teacherId = LoginStorageHelper.retrieveId(); // Get teacherId from Login_Storage_Helper
    return "$baseurl/api/teacher/$teacherId"; // Append teacherId to the departmentApiUrl
  }

  static String get semesterWithSubjectApiUrl {
    int? teacherId = LoginStorageHelper.retrieveId();
    int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
    // Get teacherId from Login_Storage_Helper
    return "$baseurl/api/teacher/$teacherId/$departmentId";
    // Append teacherId and departmentId to the semesterApiUrl// Append teacherId to the departmentApiUrl
  }
static String  get StudentDataAPiUrl{

  int departmentId = SelectedDepartmentIdStore().selectedDepartmentId;
  int semesterId=SelectedSemesterIdStore().SelectedSemesterId as int ;
  return "$baseurl/api/student/$departmentId/$semesterId";
}
  static String get takeAttendanceDataAPiUrl {
    return "$baseurl/api/attendance/create";
  }
   static String get studentTabDepartmentApiUrl{

    return "$baseurl/api/dept/all";
   }

   static String get StudentTabSemesterWithSubjectsAPiUrl {
    int departmentId= StudentTabSelectedDepartmentIdStore().selectedDepartmentId;
    return "$baseurl/api/dept/subjects/$departmentId";
   }
}

