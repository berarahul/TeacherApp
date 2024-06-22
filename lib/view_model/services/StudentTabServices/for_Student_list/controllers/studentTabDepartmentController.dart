import 'dart:convert';
import 'package:attendence/repository/StudentDropdownRepository/StudentDropdownRepository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../../models/for_student_tab/Department_Model.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';
 // Adjust the path as needed

class StudentTabDepartmentController extends GetxController {
  var departments = <StudentTabDepartmentModel>[].obs;
  var selectedDepartment = Rx<StudentTabDepartmentModel?>(null);
  var isLoading = true.obs;
  StudentTabSelectedDepartmentIdStore selectedDepartmentIdStore=Get.put(StudentTabSelectedDepartmentIdStore());
  @override
  void onInit() {
    fetchDepartments();
    super.onInit();
  }

  void fetchDepartments() async {
    try {
      isLoading(true);
      var response =  await http.get(Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/all'));
      print(response);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        var departmentList = data.map((department) => StudentTabDepartmentModel.fromJson(department)).toList();
        departments.value = departmentList;
        print(departmentList);
      } else {
        // Handle the error
        print('Failed to load departments');
      }
    } catch (e) {
      // Handle the exception
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void setSelectedDepartment(StudentTabDepartmentModel department) {
    selectedDepartment.value = department;
    selectedDepartmentIdStore.selectedDepartmentId;
    print("id :: $selectedDepartmentIdStore");
    print(department.departmentName);
    print(department.id);
  }
}
