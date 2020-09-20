import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import '../screens/input_page.dart';
import '../constants/constants.dart';

class OnboardingPage extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF007ECB),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('images/bmi_part1_onboarding.png'),
        body: Text(
          'BMI Calculator is easy to use to calculate your BMI',
        ),
        title: Text(
          'BMI Calulator',
        ),
        titleTextStyle: kLabelTextStyleL,
        bodyTextStyle: TextStyle(fontFamily: 'SF Pro Display', color: Colors.white),
        mainImage: Image.asset(
          'images/bmi_part1_onboarding.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
        pageColor: const Color(0xFF24D678),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('images/bmi_part2_onboarding.png'),
        body: Text(
          'Just put in you weight, height and your lenght and find out the result',
        ),
        title: Text(
          'BMI Calulator',
        ),
        titleTextStyle: TextStyle(fontFamily: 'SF Pro Display', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'SF Pro Display', color: Colors.white),
        mainImage: Image.asset(
          'images/bmi_part2_onboarding.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
        pageColor: const Color(0xFFFF9100),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('images/bmi_part3_onboarding.png'),
        body: Text(
          'Check your result. Register or log in to show your history',
        ),
        title: Text(
          'BMI Calulator',
        ),
        titleTextStyle: TextStyle(fontFamily: 'SF Pro Display', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'SF Pro Display', color: Colors.white),
        mainImage: Image.asset(
          'images/bmi_part3_onboarding.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroViewsFlutter(
        pages,
        onTapDoneButton: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InputPage()));
        },      
        showSkipButton: true,
        pageButtonTextStyles: new TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontFamily: "Regular",
        ),
      ),
    ); //Material App
  }
}
