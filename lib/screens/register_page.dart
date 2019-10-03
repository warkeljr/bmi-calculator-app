import 'dart:ffi';

import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:bmi_calculator_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'history_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;

  //String username;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        'Create',
                        style: kLabelTextStyleL,
                      ),
                      Text(
                        'Account',
                        style: kLabelTextStyleL,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kWhiteColor, width: 1.0),
                          color: kActiveCardColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        width: SizeConfig.blockSizeHorizontal * 80,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 3.0, bottom: 3.0, right: 10.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your Email',
                              hintStyle: TextStyle(letterSpacing: 1.5),
                              icon: Icon(Icons.mail),
                            ),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kWhiteColor, width: 1.0),
                          color: kActiveCardColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        width: SizeConfig.blockSizeHorizontal * 80,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 3.0, bottom: 3.0, right: 10.0),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(letterSpacing: 1.5),
                              icon: Icon(Icons.lock),
                            ),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 80,
                        child: FlatButton(
                          splashColor: Colors.pinkAccent,
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                                letterSpacing: 1.5,
                                fontSize: SizeConfig.blockSizeVertical * 2.5,
                                fontWeight: FontWeight.bold),
                          ),
                          color: kPinkColor,
                          textColor: kWhiteColor,
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () async {
                            try {
                              final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                              if (newUser != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HistoryPage()));
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Already have an account',
                        style: TextStyle(
                          color: kLightGreyColor,
                          fontSize: kFontSizeXS,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: kPinkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: kFontSizeM,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => InputPage()));
                        },
                        child: Text(
                          'Skip Sign up',
                          style: TextStyle(
                            color: kLightGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
