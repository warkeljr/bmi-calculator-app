import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi_calculator_app/models/user.dart';

import '../services/auth.dart';

import 'package:flutter/foundation.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final AuthBase _auth = AuthService();

  User _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    User user = await _auth.currentUser();
    _updateUser(user);
    print('The current logged in user = ${user.uid}');
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  final items = List<String>.generate(50, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(FontAwesomeIcons.signOutAlt),
                onPressed: () {
                  _auth.signOut();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                })
          ],
          title: const Text('Your BMI History'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              background: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Delete',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                  print('there all ${items.length} left');
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Item dismissed')));
                });
              },
              direction: DismissDirection.endToStart,
              child: Card(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
