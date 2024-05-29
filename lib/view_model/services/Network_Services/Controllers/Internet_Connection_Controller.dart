import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';



class InternetConnectionController extends GetxController {
  Connectivity _internetConnection = Connectivity();
  var isConnected = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _internetConnection.onConnectivityChanged.listen(
        internetStatus as void Function(List<ConnectivityResult> event
            )?);
  }

  void internetStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      // Show the Internet exception widget or handle the no internet case
      Get.snackbar(
        "No Internet",
        "You are not connected to the internet",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Hide the exception widget or handle the internet restored case
      Get.snackbar(
        "Internet Connected",
        "You are back online",
        snackPosition: SnackPosition.BOTTOM,
      );

    }
  }

}