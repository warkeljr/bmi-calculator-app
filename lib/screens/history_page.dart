import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi_calculator_app/constants/constants.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  //final _firestore = Firestore.instance;

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

  final items = List<String>.generate(100, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.signOutAlt),
              onPressed: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              })
        ],
        title: Text('Your BMI History'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              //leading: FlutterLogo(size: 72.0),
              title: Text(
                '${items[index]}',
                style: TextStyle(
                  color: kSoftGreenColor,
                  fontSize: kFontSizeML,
                ),
              ),
              subtitle: Text(
                '12-10-2019',
                style: TextStyle(
                  fontSize: kFontSizeM,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}

