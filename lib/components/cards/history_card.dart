import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/models/bmi.dart';

class BmiHistoryCard extends StatelessWidget {
  final Bmi _bmi;

  BmiHistoryCard(this._bmi);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Padding(padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                Text('${_bmi.bmiResultText}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                Spacer(),
                Text('${_bmi.bmiResult}'),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                Flexible(
                  child: Text('${_bmi.bmiInterpretation}',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}
