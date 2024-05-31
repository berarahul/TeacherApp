import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
import '../../../../../repository/AttendenceDropDownRepository/AttendenceDropDownRepository.dart';


class DepartmentController extends GetxController {
  // Observable list of department models
  RxList<DepartmentModel> departments = <DepartmentModel>[].obs;
  // Observable for the selected department ID
  RxInt selectedDepartmentId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch departments on initialization
    fetchDepartments();
  }

  // Fetch departments from the API
  Future<void> fetchDepartments() async {
    try {
      dynamic response = await AttendanceDropDownRepository.departmentFetch();
      print('API Response: $response'); // Log the response for debugging

      // Check if the response is not null and is a valid list
      if (response != null && response is List) {
        // Parse the response into a list of DepartmentModel objects
        List<DepartmentModel> departmentModels = (response as List)
            .map((item) => DepartmentModel.fromJson(item))
            .toList();

        // Clear existing departments and add the parsed list
        departments.clear();
        departments.addAll(departmentModels);
      } else {
        throw Exception('Invalid or empty response from API');
      }
    } catch (error) {
      print('Error fetching departments: $error'); // Log the error
    }
  }

  // Method to update departments


  // Method to update the selected department ID

}