import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helperFunctions.dart';
import '../../../../view_model/services/On_Boarding_Services/On_Boarding_Controller.dart';
class OnBoardingDotNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final controller = OnboardingController.instance;
    final dark = RHelperFunction.isDarkMode(context);
    return Positioned(
      bottom: 25,
      left: RSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: (index) {
          controller.dotNavigationClick(index); // Check this line
        },
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? RColors.light : RColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
