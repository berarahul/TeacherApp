import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helperFunctions.dart';
import '../../../../view_model/services/On_Boarding_Services/On_Boarding_Controller.dart';

class OnboardingNextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final dark = RHelperFunction.isDarkMode(context);

    return Positioned(
      right: RSizes.defaultSpace,
      bottom: RDeviceUtils.getBottomNavigationBarHeight(context),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? RColors.primaryColor : Colors.black,
        ),
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}
