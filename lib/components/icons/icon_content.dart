import 'package:flutter/material.dart';

import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

class IconContent extends StatelessWidget {

  IconContent({@required this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: SizeConfig.blockSizeVertical * 10,
        ),
        SizedBox(
          height: kSizeBoxedHeightM,
        ),
        Text(
          label,
          style: kLabelTextStyleXS,
        ),
      ],
    );
  }
}