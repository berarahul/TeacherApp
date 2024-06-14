import 'package:attendence/res/components/genarelException.dart';
import 'package:attendence/res/getx_localization/launguages.dart';
import 'package:attendence/utils/theme/theme.dart';
import 'package:attendence/view/Screens/BottomNavigation/Widgets/AttendenceTab/AttandanceTakenScreen.dart';
import 'package:attendence/view/Screens/BottomNavigation/Widgets/StudentTab/StudentDropDownScreen.dart';
import 'package:attendence/view/Screens/Login/Login_View.dart';
import 'package:attendence/view/Screens/OnBoarding/OnBoarding_View.dart';
import 'package:attendence/view/Screens/constant/AttendanceSuccessFully.dart';
import 'package:attendence/view/Screens/constant/Custom_Loading_widgets.dart';
import 'package:attendence/view/splash.dart';
import 'package:attendence/view_model/services/AttendenceTabServices/for_Dropdown/Controllers/SemesterWithSubjectController.dart';
import 'package:attendence/view_model/services/On_Boarding_Services/hasSeenOnboarding.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_storage/my_storage_controller.dart';



class MyApp extends StatelessWidget {
  final OnboardingService onboardingService = OnboardingService();
  final MyStorageController myStorageController = Get.put(MyStorageController());
   MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool hasSeenOnboarding = onboardingService.hasSeenOnboarding();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
       translations: Launguage(),
       locale: Locale('en','US'),
       fallbackLocale: Locale('en','US'),
       // home: GlobalLoadingWidget(),
       home:   hasSeenOnboarding ? LoginScreen() : OnBoardingScreen(),

     );


  }
}
