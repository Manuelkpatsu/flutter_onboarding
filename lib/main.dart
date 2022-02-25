import 'package:flutter/material.dart';
import 'package:flutter_onboarding/theme/app_theme.dart';

import 'screen/onboarding_one/onboarding_one_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const OnboardingOneScreen(),
    );
  }
}
