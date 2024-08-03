import 'dart:convert';
import 'package:attendence/view/Screens/Login/Login_View.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../models/forSingup/SingupModel.dart';

class SingupController extends GetxController {
  var isLoading = false.obs;

  Future<void> registerTeacher(TeacherRegistration teacher) async {
    isLoading.value = true; // Loading state ko true set karte hain
    final url = Uri.parse('https://attendancesystem-s1.onrender.com/register');
    final requestBody = json.encode(teacher.toJson());
    print('Request Body: $requestBody');
    // API URL ko sahi se set karein
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(teacher.toJson()),
    );

    if (response.statusCode == 201) {
      Get.snackbar('Success', 'Wait For Controller to Approve');
      print('Teacher registered successfully');
      Get.offAll(LoginScreen());

    } else {
      Get.snackbar('Error', 'Failed to register teacher: ${response.statusCode}');
      print('Failed to register teacher: ${response.statusCode}');
    }
    isLoading.value = false; // Loading state ko false set karte hain
  }
}
