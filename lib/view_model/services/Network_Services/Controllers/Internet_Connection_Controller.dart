import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetConnectionController extends GetxController {
  final Connectivity _internetConnection = Connectivity();
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _internetConnection.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      // Check if the results list is not empty
      if (results.isNotEmpty) {
        // Call internetStatus with the first result in the list
        internetStatus(results[0]);
      }
    });
  }

  void internetStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      // Handle no internet case
      Get.snackbar(
        "No Internet",
        "You are not connected to the internet",
        snackPosition: SnackPosition.BOTTOM,
      );
      isConnected.value = false;
    } else {
      // Handle internet restored case
      Get.snackbar(
        "Internet Connected",
        "You are back online",
        snackPosition: SnackPosition.BOTTOM,
      );
      isConnected.value = true;
    }
  }
}
