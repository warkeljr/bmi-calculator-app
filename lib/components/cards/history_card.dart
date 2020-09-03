import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {

  const HistoryCard(this.bmiResultText, this.bmiResult, this.bmiDate);

  final String bmiResultText;
  final String bmiResult;
  final String bmiDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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

