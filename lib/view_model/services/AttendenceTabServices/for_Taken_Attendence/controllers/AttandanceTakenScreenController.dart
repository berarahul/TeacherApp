import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../../../models/for_attandance_tab/StudentData/StudentDataModel.dart';
import '../../../../../res/AppUrl/AppUrl.dart';
import '../../../Login_Services/Login_Helper_Function/AuthariizationHeader.dart'; // Import ApiHelper

class AttendanceController extends GetxController {
  var students = <StudentDataModel>[].obs;
  final ApiHelper apiHelper = ApiHelper();

  Future<void> fetchStudents() async {
    log("fetchStudents called");
    try {
      // Fetch headers using the ApiHelper
      Map<String, String> headers = await apiHelper.getHeaders();

      // Define the API URL (adjust as per your actual URL structure)
      String apiUrl = AppUrl.StudentDataAPiUrl;
      log("Fetching students from: $apiUrl");

      // Make the API call
      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      // Check the response status code
      if (response.statusCode == 200) {
        // Parse the JSON response
        List<dynamic> responseData = jsonDecode(response.body);
        List<StudentDataModel> fetchedStudents = responseData
            .map((data) => StudentDataModel.fromJson(data))
            .toList();

        // Update the students list
        students.assignAll(fetchedStudents);
        log("Students fetched and updated: ${students.length}");

        // Optionally, reset state if needed
        resetState();
      } else {
        // Log and handle non-200 status codes
        log("Failed to fetch students: ${response.statusCode} - ${response.body}");
        throw Exception("Failed to fetch students: ${response.statusCode}");
      }
    } catch (e) {
      // Log and handle any exceptions
      log("Error fetching students: $e");
      throw Exception("Error fetching students: $e");
    }
  }

  // Toggle the attendance status of a student
  void toggleAttendance(int index) {
    if (index >= 0 && index < students.length) {
      students[index].isPresent = !students[index].isPresent;
      students.refresh();
    } else {
      log("Invalid index: $index");
    }
  }

  // Reset the state if needed
  void resetState() {
    log("State reset done");
  }
}
