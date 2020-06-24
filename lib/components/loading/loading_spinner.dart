import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SpinKitFadingCircle(
              color: kWhiteColor,
              size: 80,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'One moment please...',
              style: TextStyle(fontSize: 15.0, color: kWhiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
