import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';

import '../constants/constants.dart';
import '../components/cards/bmiReference_card.dart';

class BmiWeightStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DelayedDisplay(
            delay: Duration(milliseconds: 200),
            child: const Text(
              'BMI',
              style: kLabelTextStyleL,
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 300),
            child: const Text(
              'Reference',
              style: kLabelTextStyleL,
            ),
          ),
          SizedBox(
            height: kSizeBoxedHeightXXL,
          ),
          Flexible(
            child: ListView(
              children: <Widget>[
                DelayedDisplay(
                  delay: Duration(milliseconds: 400),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiBlueDark,
                      indicator: '< 16',
                      explanation: 'Very serious underweight'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 600),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiBlueMiddle,
                      indicator: '16.0 - 16.9',
                      explanation: 'Severely underweight'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 800),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiBlueLight,
                      indicator: '17.0 - 18.4',
                      explanation: 'Underweight'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1000),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiGreenColor,
                      indicator: '18.5 - 24.9',
                      explanation: 'Normal'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1200),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiYellow,
                      indicator: '25.0 - 29.9',
                      explanation: 'Overweight'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1400),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiOrangeLight,
                      indicator: '30.0 - 34.9',
                      explanation: 'Obesity class 1'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1600),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiOrangeDark,
                      indicator: '35.0 - 39.9',
                      explanation: 'Obesity class 2'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1800),
                  slidingBeginOffset: Offset(0.35, 0.0),
                  child: BmiReferenceCard(
                      colour: kBmiRed,
                      indicator: '40 - >',
                      explanation: 'Obesity class 3'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
