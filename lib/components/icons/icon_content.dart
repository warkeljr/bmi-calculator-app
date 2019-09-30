import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../models/size_config.dart';

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