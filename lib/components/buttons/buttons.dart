import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../models/size_config.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: kGreyColor,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
