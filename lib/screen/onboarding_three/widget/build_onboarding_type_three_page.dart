import 'package:flutter/material.dart';
import 'package:flutter_onboarding/model/onboard_model.dart';
import 'package:flutter_onboarding/theme/app_color.dart';
import 'package:flutter_onboarding/theme/styles.dart';

class BuildOnboardingTypeThreePage extends StatelessWidget {
  final OnboardModel onboardModel;

  const BuildOnboardingTypeThreePage({Key? key, required this.onboardModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Text(
            onboardModel.title,
            textAlign: TextAlign.center,
            style: hugeStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            onboardModel.subTitle,
            textAlign: TextAlign.center,
            style: normalStyle.copyWith(
              color: AppColor.textColor.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),
          Image.asset(
            onboardModel.image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
