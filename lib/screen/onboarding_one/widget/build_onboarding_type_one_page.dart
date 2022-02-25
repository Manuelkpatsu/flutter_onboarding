import 'package:flutter/material.dart';
import 'package:flutter_onboarding/model/onboard_model.dart';
import 'package:flutter_onboarding/theme/styles.dart';

class BuildOnboardingTypeOnePage extends StatelessWidget {
  final OnboardModel onboardModel;
  final int currentPageIndex;
  final int totalNumberOfPages;

  const BuildOnboardingTypeOnePage({
    Key? key,
    required this.onboardModel,
    required this.currentPageIndex,
    required this.totalNumberOfPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Text(
          '$currentPageIndex of $totalNumberOfPages',
          textAlign: TextAlign.center,
          style: mediumStyle.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 30),
        Image.asset(
          onboardModel.image,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                onboardModel.title,
                textAlign: TextAlign.center,
                style: hugeStyle,
              ),
              const SizedBox(height: 20),
              Text(
                onboardModel.subTitle,
                textAlign: TextAlign.center,
                style: normalStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
