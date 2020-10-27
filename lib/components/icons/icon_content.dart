import 'package:flutter/material.dart';

import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

class IconContent extends StatefulWidget {
  IconContent({@required this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  _IconContentState createState() => _IconContentState();
}

class _IconContentState extends State<IconContent>
    with SingleTickerProviderStateMixin {
  //AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // _controller = AnimationController(vsync);

    // _controller.forward();

    // _controller.addListener(() {
    //   print(_controller.value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          widget.icon,
          size: SizeConfig.blockSizeVertical * 10,
        ),
        SizedBox(
          height: kSizeBoxedHeightM,
        ),
        Text(
          widget.label,
          style: kLabelTextStyleXS,
        ),
      ],
    );
  }
}
