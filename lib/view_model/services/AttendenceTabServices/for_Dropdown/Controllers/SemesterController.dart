
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:attendence/view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../../../../res/AppUrl/AppUrl.dart';

class SemestreController extends GetxController {
  final RxInt semesterId = 0.obs;


  final ApiHelper apiHelper = ApiHelper();
  var fetchingSemesterList = <int>[].obs;
  var isLoading = true.obs;


  Future<void> fetchSemester() async {
    try {
      isLoading(true);  // Set loading to true
      Map<String, String> headers = await apiHelper.getHeaders();
      String apiUrl = AppUrl.semesterWithSubjectApiUrl;
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);
        List<int> semesterIds = responseData.cast<int>();  // Directly cast the list to List<int>
        fetchingSemesterList.assignAll(semesterIds);
      } else {
        print("hi i am semester");
        // Handle non-200 responses
        print("Error: Non-200 response code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);  // Set loading to false
    }
  }

  void setSemesterId(int? id) {
    semesterId.value = id!;

    // Additional actions can be performed here
  }
  void clearSemesterlist(){
    fetchingSemesterList.clear();
  }

}
