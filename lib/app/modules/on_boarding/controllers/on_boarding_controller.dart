import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../assets/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../models/introduction_screen.model.dart';

class OnBoardingController extends GetxController {
  var currentPage = 0;

  final screensData = <IntroductionScreenModel>[
    IntroductionScreenModel(
      "More Traffic, More Profit",
      "Join YummySwipe and get more orders, more traffic, and more profit!",
      Assets.svg.chef.path,
      // Assets.svg.darkManageTask.path,
    ),
    // IntroductionScreenModel(
    //   AppStrings.introductionPage2Title,
    //   AppStrings.introductionPage2Content,
    //   Assets.svg.deliveryBoy.path,
    //   // Assets.svg.darkTaskList.path,
    // ),
  ];

  // get total pages
  int get totalPages => screensData.length;

  final PageController pageController = PageController(initialPage: 0);

  nextPage() {
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  goToGettingStartedPage() {
    Get.offAllNamed(Routes.GETTING_STARTED);
  }

  @override
  onClose() {
    pageController.dispose();
  }

  onPageChange(int value) {
    currentPage = value;
    update();
  }
}
