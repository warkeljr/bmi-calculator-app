import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants/constants.dart';

class ScreenTitle extends StatelessWidget {
  final String text;
  ScreenTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: Text(
          text,
          style: kLabelTextStyleL,
        ),
        //curve: Curves.bounceOut,
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 500),
        builder: (
          BuildContext context,
          double _val,
          Widget child,
        ) {
          return Opacity(
            opacity: _val,
            child: Padding(
              padding: EdgeInsets.only(top: _val * 10),
              child: child,
            ),
          );
        });
  }
}
