import 'package:bmi_calculator_app/components/buttons/buttons.dart';
import 'package:bmi_calculator_app/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/constants/constants.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  final _firestore = Firestore.instance;


  @override
  void initState() {
    super.initState();
    getCurrentUser();
    bmiResultsStream();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void bmiResultsStream() async {
    await for (var snapshot in _firestore.collection('bmiResults').snapshots()) {
      for (var bmiResult in snapshot.documents) {
        print(bmiResult.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.signOutAlt), onPressed: () {
            _auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
          })
        ],
        title: Text('Your BMI History'),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome',
                          style: kLabelTextStyleL,
                        ),
                        Text(
                          'Back',
                          style: kLabelTextStyleL,
                        ),
                      ],
                    ),
                  ),
                FutureBuilder(
                  future: FirebaseAuth.instance.currentUser(),
                  builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.uid);
                    }
                    else {
                      return Text('Not logged in');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
