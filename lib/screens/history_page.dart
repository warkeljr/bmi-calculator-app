import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../screens/input_page.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../models/bmi.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final AuthBase _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Bmi>>.value(
      value: DatabaseService().bmiHistory,
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
          body: Text('Hello'), // Hier moet BMi List komen
          
      
        ),
      ),
    );
  }
}
