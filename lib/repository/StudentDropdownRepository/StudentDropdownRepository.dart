import '../../data/network/Network_Api_Services.dart';
import '../../res/AppUrl/AppUrl.dart';

class Studentdropdownrepository{

  static final _apiServices = NetworkApiServices();


  static Future<dynamic> allDepartmentDataFetch() async {
    dynamic response=await _apiServices.getApi(AppUrl.studentTabDepartmentApiUrl);
    return response;
  }




  static Future<dynamic> departmentWiseSemesterAndSubjectFetch() async {
    dynamic response=await _apiServices.getApi(AppUrl.StudentTabSemesterWithSubjectsAPiUrl);

    return response;
  }


}