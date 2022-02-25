import 'package:flutter/material.dart';
import 'package:flutter_onboarding/model/onboard_model.dart';
import 'package:flutter_onboarding/screen/home/home_screen.dart';
import 'package:flutter_onboarding/theme/app_color.dart';
import 'package:flutter_onboarding/theme/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widget/build_onboarding_type_two_page.dart';

class OnboardingTwoScreen extends StatefulWidget {
  const OnboardingTwoScreen({Key? key}) : super(key: key);

  @override
  _OnboardingTwoScreenState createState() => _OnboardingTwoScreenState();
}

class _OnboardingTwoScreenState extends State<OnboardingTwoScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  final List<OnboardModel> _models = [
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper. Sed sapien metus, scelerisque nec pharetra id, tempor a tortor. Pellentesque non dignissim neque.',
      image: 'assets/onboarding_two/onboarding-1.png',
    ),
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper. Sed sapien metus, scelerisque nec pharetra id, tempor a tortor. Pellentesque non dignissim neque.',
      image: 'assets/onboarding_two/onboarding-2.png',
    ),
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper. Sed sapien metus, scelerisque nec pharetra id, tempor a tortor. Pellentesque non dignissim neque.',
      image: 'assets/onboarding_two/onboarding-3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: _models.length,
        controller: _controller,
        onPageChanged: (index) {
          setState(() => isLastPage = index == 2);
        },
        itemBuilder: (context, index) {
          OnboardModel model = _models[index];

          return BuildOnboardingTypeTwoPage(onboardModel: model);
        },
      ),
      bottomSheet: isLastPage
          ? ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )),
              child: Text('Get started now'.toUpperCase()))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _controller.jumpToPage(2),
                    child: Text(
                      'Skip'.toUpperCase(),
                      style: buttonStyle.copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: _models.length,
                    effect: WormEffect(
                      spacing: 10,
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: AppColor.textColor.withOpacity(0.1),
                      activeDotColor: AppColor.textColor.withOpacity(0.5),
                    ),
                    onDotClicked: (index) => _controller.animateToPage(
                      index,
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeIn,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _controller.nextPage(
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      'Next'.toUpperCase(),
                      style: buttonStyle.copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
