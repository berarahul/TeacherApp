import 'package:attendence/view_model/services/Network_Services/Controllers/Internet_Connection_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void>main() async{

  await GetStorage.init();

  runApp( MyApp());
  Get.put(InternetConnectionController(),permanent: true);

}
