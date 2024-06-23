
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../../models/for_attandance_tab/DepartmentModel.dart';
import '../../../../../res/AppUrl/AppUrl.dart';
import '../../../Login_Services/Login_Helper_Function/AuthariizationHeader.dart';

class DepartmentController extends GetxController {
  RxList<DepartmentModel> departments = <DepartmentModel>[].obs;
  RxInt selectedDepartmentId = 0.obs;

  final ApiHelper apiHelper = ApiHelper();

  Future<void> fetchDepartments() async {
    try {
      print('Fetching departments...');

      // Get headers with authorization token
      Map<String, String> headers = await apiHelper.getHeaders();
      print('Headers: $headers');

      // Construct API URL
      String apiUrl = AppUrl.departmentApiUrl;
      print('API URL: $apiUrl');

      // Make GET request to fetch departments
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Parse JSON response
        List<dynamic> responseData = jsonDecode(response.body);
        List<DepartmentModel> departmentModels = responseData
            .map((item) => DepartmentModel.fromJson(item))
            .toList();

        // Update departments list
        departments.clear();
        departments.addAll(departmentModels);

        print('Departments fetched successfully');
      } else {
        print('Failed to fetch departments: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to fetch departments');
      }
    } catch (error) {
      print('Error fetching departments: $error');
    }
  }
}
