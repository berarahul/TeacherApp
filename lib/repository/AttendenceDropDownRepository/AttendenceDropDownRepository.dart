import '../../data/network/Network_Api_Services.dart';
import '../../res/AppUrl/AppUrl.dart';
class AttendanceDropDownRepository {
 static final _apiServices = NetworkApiServices();

 static Future<dynamic> departmentFetch() async {
    dynamic response = await _apiServices.getApi(AppUrl.departmentApiUrl); // Replace 'departmentUrl' with your actual department API endpoint
    return response;
  }

  static Future<dynamic> semesterWithSubjectFetch() async {
    dynamic response = await _apiServices.getApi(AppUrl.semesterWithSubjectApiUrl); // Replace 'semesterUrl' with your actual semester API endpoint
    return response;
  }


}
