// Analysis: Details - target - deadline -
// Structure - Layer - Feature - Hexa
// State management - Getx
// 1. UI + Functional 2. State management 3. Api integration

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/screens/splash_screen.dart';
import 'ui/utils/app_colors.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
