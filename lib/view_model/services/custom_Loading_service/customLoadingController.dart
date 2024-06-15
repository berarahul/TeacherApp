import 'package:get/get.dart';

     class LoadingController extends GetxController {
 static  var isLoading = false.obs;

  static void showLoading() {
    isLoading.value = true;
  }

static  void hideLoading() {
    isLoading.value = false;
  }
}
