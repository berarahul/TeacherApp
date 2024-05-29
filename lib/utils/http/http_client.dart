import 'dart:convert';
import 'package:http/http.dart' as http;

// import '../../features/MainScreens/tab/attendenceTab/Model/DepartmentModel.dart';
//
// class ApiService {
//   static const String baseUrl = 'https://attendancesystem-s1.onrender.com/api';
//
//   // Endpoints
//   static const String allDepartmentsEndpoint = '/dept/all';
//   static const String subjectsEndpoint = '/dept/subjects/';
//
//   Future<void> fetchDepartments() async {
//     final response = await http.get(Uri.parse('$baseUrl$allDepartmentsEndpoint'));
//     if (response.statusCode == 200) {
//       List<dynamic> jsonResponse = json.decode(response.body);
//       // Process departments data
//       // notifyListeners();
//     } else {
//       throw Exception('Failed to load departments');
//     }
//   }
//
//   Future<void> fetchSubjects(Department department) async {
//     final response = await http.get(Uri.parse('$baseUrl$subjectsEndpoint${department.id}'));
//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonResponse = json.decode(response.body);
//       // Check and process subjects data
//       // notifyListeners();
//     } else {
//       throw Exception('Failed to load subjects');
//     }
//   }
//
// // Other methods and constants as needed
// }
