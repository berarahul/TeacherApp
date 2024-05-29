
// import 'package:attendence/VIEW/splashScreen.dart';
import 'package:attendence/res/routes/routes_name.dart';
import 'package:get/get.dart';


import '../../view/Screens/OnBoarding/OnBoarding_View.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => OnBoardingScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRight),
      ];
}
