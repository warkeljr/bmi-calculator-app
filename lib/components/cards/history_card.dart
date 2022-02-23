import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/models/bmi.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class BmiHistoryCard extends StatelessWidget {
  final Bmi _bmi;

  BmiHistoryCard(this._bmi);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kActiveCardColor,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Slidable(
          key: ValueKey(0),
          endActionPane: ActionPane(
            motion: DrawerMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: null,
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 0.0)),
                    Text(
                      '${_bmi.bmiResultText}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: bmicolor()),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 5,
                    ),
                    Flexible(
                      child: Text(
                        '${_bmi.bmiResult}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: bmicolor()),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 1,
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 0.0)),
                    Flexible(
                      child: Text(
                        '${_bmi.bmiInterpretation}',
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color? bmicolor() {
    if (_bmi.bmiResult == 'Very serious underweight') {
      return kBmiBlueDark;
    } else if (_bmi.bmiResult == 'Severely underweight') {
      return kBmiBlueMiddle;
    } else if (_bmi.bmiResult == 'Underweight') {
      return kBmiBlueLight;
    } else if (_bmi.bmiResult == 'Normal') {
      return kBmiGreenColor;
    } else if (_bmi.bmiResult == 'Overweight') {
      return kBmiYellow;
    } else if (_bmi.bmiResult == 'Obesity class 1') {
      return kBmiOrangeLight;
    } else if (_bmi.bmiResult == 'Obesity class 2') {
      return kBmiOrangeDark;
    } else if (_bmi.bmiResult == 'Obesity class 3') {
      return kBmiRed;
    } else {
      return kWhiteColor;
    }
  }
}

