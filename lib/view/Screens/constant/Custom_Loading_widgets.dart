import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/services/custom_Loading_service/customLoadingController.dart';
 // Import the LoadingController

class GlobalLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      final isLoading = LoadingController.isLoading.value; // Accessing static isLoading

      if (!isLoading) {
        return SizedBox.shrink();
      }
      return Container(
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
