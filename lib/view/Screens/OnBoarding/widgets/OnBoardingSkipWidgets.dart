import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helperFunctions.dart';
import '../../../../view_model/services/On_Boarding_Services/On_Boarding_Controller.dart';
class OnBoardingSkip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final dark = RHelperFunction.isDarkMode(context);

    return Positioned(
      top: RDeviceUtils.getAppBarHeight(context),
      right: RSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: Text(
          'Skip',
          style: TextStyle(
            color: dark ? RColors.primaryColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
