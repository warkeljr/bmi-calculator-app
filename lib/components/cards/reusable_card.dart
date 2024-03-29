import 'dart:ffi';

import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  const ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color? colour;
  final Widget? cardChild;
  final Void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}