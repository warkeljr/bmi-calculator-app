import 'package:flutter/material.dart';

class ButtonAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 500),
        builder: (
          BuildContext context,
          double _val,
          Widget child,
        ) {
          return Opacity(
            opacity: _val,
            child: child,
          );
        });
  }
}
