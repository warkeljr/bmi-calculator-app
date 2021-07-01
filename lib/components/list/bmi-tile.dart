import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/models/bmi.dart';

class BmiTile extends StatelessWidget {
  final Bmi bmi;
  BmiTile({this.bmi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Text(
            bmi.bmiResultText,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              bmi.bmiResult,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(bmi.bmiInterpretation),
          ),
        ),
      ),
    );
  }
}
