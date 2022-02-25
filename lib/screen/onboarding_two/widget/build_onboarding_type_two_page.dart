import 'package:flutter/material.dart';
import 'package:flutter_onboarding/model/onboard_model.dart';
import 'package:flutter_onboarding/theme/app_color.dart';
import 'package:flutter_onboarding/theme/styles.dart';

class BuildOnboardingTypeTwoPage extends StatelessWidget {
  final OnboardModel onboardModel;

  const BuildOnboardingTypeTwoPage({Key? key, required this.onboardModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Image.asset(
            onboardModel.image,
            width: MediaQuery.of(context).size.width,
            height: 240,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 40),
          Text(
            onboardModel.title,
            textAlign: TextAlign.center,
            style: hugeStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            onboardModel.subTitle,
            textAlign: TextAlign.center,
            style: normalStyle.copyWith(
              color: AppColor.textColor.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
