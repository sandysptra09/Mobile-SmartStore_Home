import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smartstore_home/app/routes/app_pages.dart';
import 'package:smartstore_home/app/shared/theme.dart';
import 'package:smartstore_home/app/widgets/OnBoardingWidgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.indicator,
          onPageChanged: ((value) {
            controller.page.value = value;
            print(controller.page.value);
          }),
          children: [
            // start page onboarding
            OnBoardingWidgets(
              image: 'on_boarding_1.png',
              title: 'Welcome to SmartStore Home',
              subtitle:
                  'Explore a world of smart home devices and \naccessories. Make your home smarter and more efficient\nwith our wide range of products.',
            ),
            OnBoardingWidgets(
              image: 'on_boarding_2.png',
              title: 'Seamless Integration',
              subtitle:
                  'Easily integrate our smart devices into\your home. Our products are designed to work with  \popular smart home platforms for a seamless experience.',
            ),
            OnBoardingWidgets(
              image: 'on_boarding_.png',
              title: 'Expert Guidance',
              subtitle:
                  'Get expert guidance with installation\ntutorials and tips. Our goal is to make setting\nup your smart home as easy as possible.',
            ),
            // end
          ],
        ),
        Container(
          alignment: Alignment(0.8, -0.85),
          child: GestureDetector(
            onTap: () {
              controller.indicator.jumpToPage(3);
            },
            child: Text('Skip'),
          ),
        ),
        Obx(() => Container(
              alignment: Alignment(0, 0.85),
              child: controller.page.value != 2
                  ? SmoothPageIndicator(
                      controller: controller.indicator,
                      count: 3,
                      effect: SlideEffect(
                        activeDotColor: emerald,
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: darkGrey,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.SIGNUP);
                      },
                      child: Container(
                        height: 55,
                        width: Get.width * 0.8,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: emerald,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Getting Started',
                          style: semibold.copyWith(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ))
      ],
    ));
  }
}
