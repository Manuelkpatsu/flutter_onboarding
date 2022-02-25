import 'package:flutter/material.dart';
import 'package:flutter_onboarding/model/onboard_model.dart';
import 'package:flutter_onboarding/screen/home/home_screen.dart';
import 'package:flutter_onboarding/theme/app_color.dart';
import 'package:flutter_onboarding/theme/styles.dart';

import 'widget/build_onboarding_type_three_page.dart';

class OnboardingThreeScreen extends StatefulWidget {
  const OnboardingThreeScreen({Key? key}) : super(key: key);

  @override
  _OnboardingThreeScreenState createState() => _OnboardingThreeScreenState();
}

class _OnboardingThreeScreenState extends State<OnboardingThreeScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  final List<OnboardModel> _models = [
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper.',
      image: 'assets/onboarding_three/onboarding-1.png',
    ),
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper.',
      image: 'assets/onboarding_three/onboarding-2.png',
    ),
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper.',
      image: 'assets/onboarding_three/onboarding-3.png',
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

          return BuildOnboardingTypeThreePage(onboardModel: model);
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: isLastPage
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                child: Text(
                  'Proceed'.toUpperCase(),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _controller.jumpToPage(2),
                    child: Text(
                      'Skip for now',
                      style: buttonStyle.copyWith(color: AppColor.textColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _controller.nextPage(
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      'Continue'.toUpperCase(),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
