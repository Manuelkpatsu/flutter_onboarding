import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/theme/styles.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColor.primaryColor,
      fontFamily: 'Montserrat',
      canvasColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      primarySwatch: AppColor.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: buttonStyle,
          primary: AppColor.primaryColor,
          elevation: 0,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          minimumSize: const Size(double.infinity, 45),
        ),
      ),
    );
  }
}
