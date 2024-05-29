import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../res/Colors/AppColors.dart';



class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessageBottom(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.dark,
gravity:  ToastGravity.BOTTOM,
    );
  }
  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.dark,
      gravity:  ToastGravity.CENTER,
    );
  }
  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,

    );
  }
}
