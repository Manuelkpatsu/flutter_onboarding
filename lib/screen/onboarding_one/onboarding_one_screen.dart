import 'package:flutter/material.dart';
import 'package:flutter_onboarding/screen/home/home_screen.dart';
import 'package:flutter_onboarding/screen/onboarding_one/widget/build_onboarding_type_one_page.dart';
import 'package:flutter_onboarding/theme/app_color.dart';
import 'package:flutter_onboarding/theme/styles.dart';

import '../../model/onboard_model.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  _OnboardingOneScreenState createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  final List<OnboardModel> _models = [
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper. Sed sapien metus, scelerisque nec pharetra id, tempor a tortor. Pellentesque non dignissim neque.',
      image: 'assets/onboarding_one/onboarding-1.png',
    ),
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper. Sed sapien metus, scelerisque nec pharetra id, tempor a tortor. Pellentesque non dignissim neque.',
      image: 'assets/onboarding_one/onboarding-2.png',
    ),
    OnboardModel(
      title: 'In hac habitasse platea dictumst.',
      subTitle:
          'Donec facilisis tortor ut augue lacinia, at viverra est semper. Sed sapien metus, scelerisque nec pharetra id, tempor a tortor. Pellentesque non dignissim neque.',
      image: 'assets/onboarding_one/onboarding-3.png',
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

          return BuildOnboardingTypeOnePage(
            currentPageIndex: index + 1,
            totalNumberOfPages: _models.length,
            onboardModel: model,
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: isLastPage
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: Text('Get started now'.toUpperCase()),
              )
            : Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: Text('Proceed'.toUpperCase()),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () => _controller.jumpToPage(2),
                    child: Text(
                      'Skip'.toUpperCase(),
                      style: buttonStyle.copyWith(color: AppColor.textColor),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
