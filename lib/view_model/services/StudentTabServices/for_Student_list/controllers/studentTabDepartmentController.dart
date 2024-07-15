
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../../../../../models/for_student_tab/Department_Model.dart';
import '../../../Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../ForDropdown/StudentsDroodownHelperFunctions/StudentTabSelectedDepartmentIdStore.dart';

class StudentTabDepartmentController extends GetxController {
  var departments = <StudentTabDepartmentModel>[].obs;
  var selectedDepartment = Rx<StudentTabDepartmentModel?>(null);
  var isLoading = true.obs;
  final ApiHelper apiHelper = ApiHelper(); // Instantiate ApiHelper

  StudentTabSelectedDepartmentIdStore selectedDepartmentIdStore = Get.put(StudentTabSelectedDepartmentIdStore());

  @override
  void onInit() {
     fetchDepartments();
    super.onInit();
}

  Future<void> fetchDepartments() async {
    try {
      isLoading(true);

      // Fetch headers using ApiHelper
      Map<String, String> headers;
      try {
        headers = await apiHelper.getHeaders();
      } catch (e) {
        print('Error getting headers: $e');
        return;
      }

      var response = await http.get(
        Uri.parse('https://attendancesystem-s1.onrender.com/api/dept/all'),
        headers: headers, // Pass headers to the request
      );

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
    selectedDepartmentIdStore.selectedDepartmentId = department.id; // Example of storing selected department ID
    print("Selected department ID: ${selectedDepartmentIdStore.selectedDepartmentId}");
    print(department.departmentName);
    print(department.id);
  }
}
