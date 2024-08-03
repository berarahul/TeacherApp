import 'package:attendence/view_model/services/HolidayServices/HolidayChecker.dart';
import 'package:attendence/view_model/services/HomeTabService/homeTabController.dart';
import 'package:attendence/view_model/services/Network_Services/Controllers/Internet_Connection_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void>main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // Call the holiday checker function when the app starts

  HolidayChecker.checkForHoliday();
  await GetStorage.init();

  runApp( MyApp());
  Get.put(InternetConnectionController(),permanent: true);

}