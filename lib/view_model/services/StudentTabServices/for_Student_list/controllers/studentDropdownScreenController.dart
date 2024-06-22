import 'package:attendence/view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceDropdownScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StudentTabDropdownScreenController extends GetxController{

  var isLoading = false.obs;
  void setLoading(bool value) {
    isLoading.value = value;
  }


}