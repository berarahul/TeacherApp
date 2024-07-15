import 'package:attendence/view/Screens/BottomNavigation/Bottom_Navigation_Menu.dart';
import 'package:attendence/view_model/services/Login_Services/Login_Helper_Function/LoginAuthServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendence/res/getx_localization/launguages.dart';
import 'package:attendence/utils/theme/theme.dart';
import 'package:attendence/view/Screens/Login/Login_View.dart';
import 'package:attendence/view/Screens/OnBoarding/OnBoarding_View.dart';
import 'package:attendence/view_model/services/On_Boarding_Services/hasSeenOnboarding.dart';


class MyApp extends StatelessWidget {
  final OnboardingService onboardingService = OnboardingService();
  final AuthService authService = Get.put(AuthService());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasSeenOnboarding = onboardingService.hasSeenOnboarding();
    bool isLoggedIn = authService.isLoggedIn();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      translations: Launguage(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: isLoggedIn ? BottomNavigationMenu() : (hasSeenOnboarding ? LoginScreen() : OnBoardingScreen()),
    );
  }
}
