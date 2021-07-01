import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator_app/views//input_page.dart';
// import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/services/database.dart';
import 'package:bmi_calculator_app/models/bmi.dart';
import 'package:bmi_calculator_app/components/list/bmi_list.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // final AuthBase _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Bmi>>.value(
      value: DatabaseService().bmiHistory,
      initialData: List(),
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                }),
            title: Text('BMI History'),
          ),
          body: BmiList(),
        ),
      ),
    );
  }
}

