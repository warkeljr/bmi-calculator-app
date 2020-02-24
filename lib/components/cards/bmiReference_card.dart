
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

class BmiReferenceCard extends StatelessWidget {
  const BmiReferenceCard(
      {@required this.colour, this.indicator, this.explanation});

  final Color colour;
  final String indicator;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 12,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            indicator,
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 4.0,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            explanation,
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 2.5,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}