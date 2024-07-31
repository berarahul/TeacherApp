//
// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../../../../models/for_attandance_tab/SemesterWithSubjectModel.dart';
//
// import '../../../../../res/AppUrl/AppUrl.dart';
// import '../../../Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
// // Import AppUrl
//
// class SemesterWithSubjectsController extends GetxController {
//
//   // latest Changes ............
//
//   var FetchingSemesterList=[].obs;
//
//
//
//   // latest Changes
//
//   var semesterSubjectMap = <int, List<Semesterwithsubjectmodel>>{}.obs;
//   var selectedSubject = Rx<Semesterwithsubjectmodel?>(null);
//   late final selectedSemester = "0".obs;
//
//   final ApiHelper apiHelper = ApiHelper(); // Instance of ApiHelper
//
//   void setSelectedSemester(String value) {
//     selectedSemester.value = value;
//     print("Selected Semester: $value");
//   }
//
//   void setSelectedSubject(Semesterwithsubjectmodel? value) {
//     selectedSubject.value = value;
//     print(value);
//   }
//
//   void updateSubjects(List<Semesterwithsubjectmodel> subjects) {
//     // Not necessary for this controller, keeping for consistency
//   }
//
//
//
//   Future<void> fetchSemester() async {
//     try{
//       Map<String, String> headers = await apiHelper.getHeaders();
//
//       String apiUrl = AppUrl.semesterWithSubjectApiUrl;
//
//       var response = await http.get(
//         Uri.parse(apiUrl),
//         headers: headers,
//       );
//       print('Fetching semester subjects...');
//       print('Headers: $headers');
//       print('API URL: $apiUrl');
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       if (response==200){
//         List<dynamic> responseData = jsonDecode(response.body);
//         FetchingSemesterList.assignAll(responseData);
//       print(responseData);
//
//
//       }
//
//     }
//     catch(e){
//
//     }
//   }
//
//
//   Future<void> fetchSemesterSubjects() async {
//     try {
//
//       Map<String, String> headers = await apiHelper.getHeaders();
//
//       String apiUrl = AppUrl.semesterWithSubjectApiUrl; // Get API URL from AppUrl
//       var response = await http.get(
//         Uri.parse(apiUrl),
//         headers: headers,
//       );
//
//       print('Fetching semester subjects...');
//       print('Headers: $headers');
//       print('API URL: $apiUrl');
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//
//       if (response.statusCode == 200) {
//         List<dynamic> responseData = jsonDecode(response.body);
//         List<Semesterwithsubjectmodel> semesterSubjects = responseData
//             .map((item) => Semesterwithsubjectmodel.fromJson(item))
//             .toList();
//
//         // Update the observable map directly with parsed semester subjects
//         semesterSubjectMap.value =
//             semesterSubjects.fold<Map<int, List<Semesterwithsubjectmodel>>>(
//               {},
//                   (map, subject) {
//                 map[subject.semester] = (map[subject.semester] ?? [])..add(subject);
//                 return map;
//               },
//             );
//         print('Semester subjects fetched successfully');
//         print(semesterSubjectMap);
//         log(semesterSubjectMap.toString());
//       } else {
//         print('Failed to fetch semester subjects: ${response.statusCode} - ${response.body}');
//         throw Exception('Failed to fetch semester subjects');
//       }
//     } catch (e) {
//       print('Error fetching semester subjects: $e');
//     }
//   }
//
//   void clearSelections() {
//     selectedSemester.value = '';
//     selectedSubject.value = null;
//     // Clear any other related data if necessary
//   }
//   void semesterSubjectMapclear(){
//
//  semesterSubjectMap.clear();
//
//   }
// }
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

  @override
  // void onInit() {
  //   super.onInit();
  //   fetchSemester();
  // }

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
