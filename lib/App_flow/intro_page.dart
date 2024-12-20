// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/App_flow/app_flowset_page.dart';
import 'package:learn_to_code/Constrant/preferences.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Constrant/common_widgets.dart';
import '../Constrant/utilities.dart';

class IntroPage extends StatelessWidget {
  PageController _pageController = PageController();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.8,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                selectedIndex = value;
              },
              children: [
                pageViewWidget(
                  context: context,
                  titleText: "Welcome to Educatory",
                  boxText:
                      "Your go-to platform for live sessions and on-demand courses. We're excited to help you learn and grow!",
                  image: "welcome.json",
                ),
                pageViewWidget(
                  context: context,
                  titleText: "Live Session with Teachers",
                  boxText:
                      "Join live with top teachers. Session-based study with real-time feedback and support.",
                  image: "course.json",
                ),
                pageViewWidget(
                  context: context,
                  titleText: "Engage with Quizzes",
                  boxText:
                      "Test your knowledge with interactive quizzes. Track your progress and reinforce your learning!",
                  image: "exam.json",
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: JumpingDotEffect(
                spacing: 8,
                dotWidth: 18,
                dotHeight: 5,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: Colors.grey.withOpacity(0.5),
                activeDotColor: AppColors.btnBlue),
          ),
        ],
      )),
    );
  }

  Widget pageViewWidget({context, boxText, image, titleText}) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(
            height: Get.height * 0.35,
            margin: EdgeInsets.all(15),
            child: Lottie.asset('assets/images/' + image,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.medium,
                frameRate: FrameRate(120)),
          ),
          SizedBox(height: 20),
          CommonWidgets().textWidget(
              text: titleText,
              textSize: 22.0,
              textAlign: TextAlign.center,
              textWeight: FontWeight.bold),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CommonWidgets().textWidget(
                text: boxText,
                textSize: 18.0,
                textAlign: TextAlign.center,
                textWeight: FontWeight.w700),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.off(() => AppFlowsetPage());
                  Preference.preference
                      .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
                },
                child: Container(
                  height: 50,
                  width: Get.width * 0.4,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CommonWidgets().textWidget(
                        text: "Skip",
                        textSize: 18.0,
                        textAlign: TextAlign.center,
                        textWeight: FontWeight.w500),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_pageController.page == 2) {
                    Get.off(() => AppFlowsetPage());
                    Preference.preference.saveBool(
                        PrefernceKey.isIntroductionScreenLoaded, true);
                  } else {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubicEmphasized);
                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width * 0.4,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CommonWidgets().textWidget(
                        text: "Continue",
                        textSize: 18.0,
                        textAlign: TextAlign.center,
                        textWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
