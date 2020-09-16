import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:introduction_screen/introduction_screen.dart';

import '../screens/input_page.dart';
import '../constants/constants.dart';


class OnboardingScreen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Center(child: Image.asset('images/step_1.png')),
          title: 'Start with the input',
          body: 'Start selecting you height, weight and age. Calculate and see the result. Do not be scarred it is just an indication'),
      PageViewModel(
          image: Center(child: Image.asset('images/step_2.png')),
          title: 'This is the first page',
          body: 'This my first working onboarding screen with lutter'),
      PageViewModel(
          image: Center(child: Image.asset('images/step_3.png')),
          title: 'This is the first page',
          body: 'This my first working onboarding screen with lutter'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          initialPage: 0,
          globalBackgroundColor: kPrimaryColor,
          pages: getPages(),
          showSkipButton: true,
          skip: Text('Skip', style: TextStyle(fontSize: 17),),
          onSkip: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (contect) => InputPage()));
          },
          showNextButton: true,
          next:


          Icon(Icons.arrow_forward,size: 30.0),
          done: Text(
            'Done',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          onDone: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (contect) => InputPage()));
          },
          dotsDecorator: DotsDecorator(
            size: Size.square(15.0),
            activeSize: Size(25.0, 15.0),
            color: kPinkColor,
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}