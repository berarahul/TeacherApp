import 'dart:convert';
import 'package:attendence/models/for_attandance_tab/SubjectModel.dart';
import 'package:attendence/view/Screens/constant/DontHaveClass.dart';
import 'package:attendence/view/Screens/constant/SundayScreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:attendence/view_model/services/Login_Services/Login_Helper_Function/AuthariizationHeader.dart';
import '../../../../../res/AppUrl/AppUrl.dart';
import '../../../../../view/Screens/constant/dataNotfoundScreen.dart';

class SubjectController extends GetxController {
  final ApiHelper apiHelper = ApiHelper();

  final RxInt subjectId = 0.obs;
  var subjectList = <SubjectModel>[].obs;
  var isDropdownOpened = false.obs;

  void setSubjectId(int subject) {
    subjectId.value = subject;
  }

  void clearsubjects(){
    subjectList.clear();
  }
  void toggleDropdown(bool isOpened) {
    isDropdownOpened.value = isOpened;
  }
  Future<void> fetchSubjects() async {
    try {
       // Set loading to true
      Map<String, String> headers = await apiHelper.getHeaders();
      String apiUrl = AppUrl.SubjectApiUrl;
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );
      if (response.statusCode == 200) {
        List<dynamic> responseData = jsonDecode(response.body);
        List<SubjectModel> subjects = responseData.map((data) => SubjectModel.fromJson(data)).toList();

        subjectList.assignAll(subjects);
      }else if(response.statusCode==404){
        Get.to(NoClassScreen());
      }
      // else if(response.statusCode==403){
      //   Get.to(SundayScreen());
      // }

      else {
        // Handle non-200 responses
        Get.offAll(DataNotFoundScreen());
        print("hi i am subject");
        print("Error: Non-200 response code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
        // Set loading to false


  }

}
