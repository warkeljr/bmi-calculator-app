import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class Alert extends StatelessWidget {
  const Alert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPinkColor,
      // decoration: BoxDecoration(

      // ),
      title: Text('Hello Alert'),
      actions: [
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
