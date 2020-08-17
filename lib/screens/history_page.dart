import 'package:bmi_calculator_app/components/animations/screenTitleAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bmi_calculator_app/models/user.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

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
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(FontAwesomeIcons.signOutAlt),
                onPressed: () {
                  _auth.signOut();

                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                })
          ],
          title: Text('BMI History'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              background: Container(
                padding: EdgeInsets.only(right: 30),
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    //   'Delete',
                    //   textAlign: TextAlign.right,
                    //   style:
                    //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    // ),
                    SizedBox(
                      width: SizeConfig.blockSizeVertical * 2,
                    ),
                    Icon(Icons.delete, size: 30,),
                  ],
                ),
              ),
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                  print('there all ${items.length} left');
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Item removed',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      duration: Duration(seconds: 1),
                      backgroundColor: kPinkColor,
                    ),
                  );
                });
              },
              direction: DismissDirection.endToStart,
              child: Card(
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(size: SizeConfig.blockSizeHorizontal * 10),
                  ),
                  contentPadding: EdgeInsets.all(4.0),
                  title: Text(
                    '${items[index]}',
                    style: TextStyle(
                      color: kSoftGreenColor,
                      fontSize: kFontSizeML,
                    ),
                  ),
                  subtitle: Text(
                    '12-10-2020',
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
