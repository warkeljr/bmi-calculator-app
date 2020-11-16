import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bmi_calculator_app/components/cards/reusable_card.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/models/user.dart';
import 'package:bmi_calculator_app/views//input_page.dart';
import 'package:bmi_calculator_app/views//login_page.dart';
import 'package:bmi_calculator_app/services/auth.dart';

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
            return displayUserInformation(context, snapshot);
//              Text('No user logged in!');
          }
        },
      ),
    );
  }
}

Widget displayUserInformation(context, snapshot) {
  final user = Provider.of<User>(context);
  final AuthBase _auth = AuthService();
  final userSnapshot = snapshot.data;

  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 200),
                  child: Text(
                    'Your',
                    style: kLabelTextStyleL,
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 300),
                  child: Text(
                    'Profile',
                    style: kLabelTextStyleL,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Flexible(
                        child: DelayedDisplay(
                          delay: Duration(milliseconds: 200),
                          slidingBeginOffset: Offset(-0.35, -0.0),
                          child: ReusableCard(
                            colour: kActiveCardColor,
                            cardChild: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: userSnapshot != null
                                    ? CircleAvatar(
                                        radius:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        backgroundImage:
                                            AssetImage('images/angela.png'),
                                      )
                                    : Icon(
                                        Icons.account_circle,
                                        size: SizeConfig.blockSizeVertical * 15,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: DelayedDisplay(
                          delay: Duration(milliseconds: 200),
                          slidingBeginOffset: Offset(0.35, 0.0),
                          child: ReusableCard(
                            colour: kActiveCardColor,
                            cardChild: Padding(
                              padding: const EdgeInsets.only(left: 8.0,top: 20.0, right: 8.0, bottom: 20.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Name',
                                      style: kLabelTextStyleXS,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AutoSizeText(
                                      userSnapshot != null
                                          ? '${userSnapshot.displayName}'
                                          : '...',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  9,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Flexible(
                        child: DelayedDisplay(
                          delay: Duration(milliseconds: 500),
                          child: ReusableCard(
                            colour: kActiveCardColor,
                            cardChild: Padding(
                              padding: const EdgeInsets.only(left: 8.0,top: 20.0, right: 8.0, bottom: 20.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Email',
                                      style: kLabelTextStyleXS,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AutoSizeText(
                                      userSnapshot != null
                                          ? '${userSnapshot.email}'
                                          : '...',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Flexible(
                        child: DelayedDisplay(
                          delay: Duration(milliseconds: 200),
                          slidingBeginOffset: Offset(-0.35, -0.0),
                          child: ReusableCard(
                            colour: kActiveCardColor,
                            cardChild: Padding(
                              padding: const EdgeInsets.only(left: 8.0,top: 20.0, right: 8.0, bottom: 20.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Created',
                                      style: kLabelTextStyleXS,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      userSnapshot != null
                                          ? '${DateFormat('MM-dd-yy').format(userSnapshot.metadata.creationTime)}'
                                          : '...',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  7,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: DelayedDisplay(
                          delay: Duration(milliseconds: 200),
                          slidingBeginOffset: Offset(0.35, 0.0),
                          child: ReusableCard(
                            colour: kActiveCardColor,
                            cardChild: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(child: Text('...')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: 1000),
          slidingCurve: Curves.elasticOut,
          child: Container(
            child: GestureDetector(
              onTap: () {
                if (user != null) {
                  _auth.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
              child: Container(
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
            ),
          ),
        ),
      ],
    ),
  );
}
