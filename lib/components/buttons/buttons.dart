import 'package:flutter/material.dart';

import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPressed, this.onLongPressed});

  final IconData? icon;
  final Function()? onPressed;
  final Function()? onLongPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RawMaterialButton(
      child: Icon(icon),
      splashColor: kPinkColor,
      onPressed: onPressed,
      onLongPress: onLongPressed,
      shape: CircleBorder(),
      fillColor: kGreyColor,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
