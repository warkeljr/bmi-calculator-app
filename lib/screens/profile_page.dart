import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/models/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthBase _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<dynamic>(
        future: _auth.getCurrentUserInfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot != null) {
              return displayUserInformation(context, snapshot);
            } else {
              return Text('No info available');
            }
          } else {
            return Text('No user logged in!');
          }
        },
      ),
    );
  }
}

Widget displayUserInformation(context, snapshot) {
  final user = Provider.of<User>(context);
  final userSnapshot = snapshot.data;
  final AuthBase _auth = AuthService();

  return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DelayedDisplay(
            delay: Duration(milliseconds: 200),
            child: const Text(
              'Your',
              style: kLabelTextStyleL,
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 300),
            child: const Text(
              'Profile',
              style: kLabelTextStyleL,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/angela.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Name: ${userSnapshot.displayName}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Email: ${userSnapshot.email}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Created: ${userSnapshot.metadata.creationTime}'),
                ),
                GestureDetector(
                  onTap: () {
                    if (user != null) {
                      _auth.signOut();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => InputPage()));
                    } else {
                      print('Sign in');
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        color: kPinkColor,
                        margin: EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Center(
                            child: user != null
                                ? Text(
                                    'Log out',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                        width: double.infinity,
                        height: SizeConfig.blockSizeVertical * 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
