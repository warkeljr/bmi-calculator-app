import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/input_page.dart';
import 'screens/onboarding_screen.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: OnboardingScreen(),
    );
  }
}