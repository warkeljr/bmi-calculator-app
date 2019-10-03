import 'package:bmi_calculator_app/components/buttons/buttons.dart';
import 'package:bmi_calculator_app/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: Builder(builder: (BuildContext context) {
//          return IconButton(
//            icon: Icon(Icons.home), onPressed: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => ResultsPage()));
//          },
//          );
//        }),
        title: Text('Your BMI History'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('welcome'),
            RaisedButton(
                child: Text('Sign out'),
                onPressed: () {
                  _auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
                })
          ],
        ),
      ),
    );
  }
}
