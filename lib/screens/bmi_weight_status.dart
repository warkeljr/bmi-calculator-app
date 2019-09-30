import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:bmi_calculator_app/components/cards/bmiReference_card.dart';

class BmiWeightStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Bmi', style: kLabelTextStyleL),
          Text('Reference', style: kLabelTextStyleL),
          SizedBox(
            height: kSizeBoxedHeightXXL,
          ),
          Flexible(
            child: ListView(
              children: <Widget>[
                BmiReferenceCard(
                  colour: kBmiBlueDark,
                  indicator: '< 16',
                  explanation: 'Very serious underweight',
                ),
                BmiReferenceCard(
                    colour: kBmiBlueMiddle,
                    indicator: '16.0 - 16.9',
                    explanation: 'Severely underweight'),
                BmiReferenceCard(colour: kBmiBlueLight, indicator: '17.0 - 18.4', explanation: 'Underweight'),
                BmiReferenceCard(colour: kBmiGreenColor, indicator: '18.5 - 24.9', explanation: 'Normal'),
                BmiReferenceCard(colour: kBmiYellow, indicator: '25.0 29.9', explanation: 'Overweight'),
                BmiReferenceCard(colour: kBmiOrangeLight, indicator: '30.0 - 34.9', explanation: 'Obesity class 1'),
                BmiReferenceCard(colour: kBmiOrangeDark, indicator: '35.0 - 39.9', explanation: 'Obesity class 2'),
                BmiReferenceCard(colour: kBmiRed, indicator: '40 - >', explanation: 'Obesity class 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
