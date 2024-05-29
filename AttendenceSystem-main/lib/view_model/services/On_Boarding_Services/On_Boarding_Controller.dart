

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../view/Screens/Login/Login_View.dart';
import 'hasSeenOnboarding.dart';

class OnboardingController extends GetxController{

static OnboardingController get instance=> Get.find();
final OnboardingService _onboardingService = OnboardingService();

// variables
final pageController=PageController();
Rx<int> currentPageIndex=0.obs;
// Update Current Index when page Scroll
   void updatePageIndicator(index)=> currentPageIndex.value=index;


  // Jump to The Specific Dot Selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

// Update Current Index And Jump To Next Page
void nextPage(){

    if (currentPageIndex.value==2) {
      // Get.to(LoginScreen());
      _onboardingService.setHasSeenOnboarding(true);
      Get.offAll(LoginScreen());
    }
    else{
      int page=currentPageIndex.value+1;
      pageController.jumpToPage(page );
    }
}
  // Update Current Index And Jump To the last page
  void skipPage(){
    print("Before skipping: ${currentPageIndex.value}");
    currentPageIndex.value = 2;
    print("After skipping: ${currentPageIndex.value}");
    pageController.jumpToPage(2);
  }

}