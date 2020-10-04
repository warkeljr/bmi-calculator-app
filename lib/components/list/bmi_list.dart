import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator_app/models/bmi.dart';

class BmiList extends StatefulWidget {
  @override
  _BmiListState createState() => _BmiListState();
}

class _BmiListState extends State<BmiList> {
  @override
  Widget build(BuildContext context) {

    final bmiHistory = Provider.of<List<Bmi>>(context);

    bmiHistory.forEach((bmi) { 
      print(bmi.bmiResultText);
      print(bmi.bmiResult);
      print(bmi.bmiInterpretation);
    });
    

    return Container(
      
    );
  }
}