import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

class HistoryCard extends StatelessWidget {

  const HistoryCard(this.bmiResultText, this.bmiResult, this.bmiDate);

  final String bmiResultText;
  final String bmiResult;
  final String bmiDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(bmiResultText),
              SizedBox(),
              Text(''),
            ],
          ),
          Text(bmiDate),
        ],
      ),
    );
  }
}

