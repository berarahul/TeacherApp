
import 'package:attendence/view/Screens/OnBoarding/widgets/OnBoardingDotNavigationWidget.dart';
import 'package:attendence/view/Screens/OnBoarding/widgets/OnBoardingNextButtonWidget.dart';
import 'package:attendence/view/Screens/OnBoarding/widgets/OnBoardingSkipWidgets.dart';
import 'package:attendence/view/Screens/OnBoarding/widgets/onBoardingPageStructure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/texts_String.dart';
import '../../../view_model/services/On_Boarding_Services/On_Boarding_Controller.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller=Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardPage(
                image: RImages.onBoardingImage1,
                title: RTexts.onBoardingTitle1,
                subTitle: RTexts.onBoardingSubTitle1,
              ),
              OnBoardPage(
                image: RImages.onBoardingImage2,
                title: RTexts.onBoardingTitle2,
                subTitle: RTexts.onBoardingSubTitle2,
              ),
              OnBoardPage(
                image: RImages.onBoardingImage3,
                title: RTexts.onBoardingTitle3,
                subTitle: RTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          OnBoardingSkip(),
          //Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),
          // Circular Button
          OnboardingNextButton()
        ],
      ),
    );
  }
}