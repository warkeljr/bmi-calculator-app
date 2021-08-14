import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:delayed_display/delayed_display.dart';

import 'package:bmi_calculator_app/views//history_page.dart';
import 'package:bmi_calculator_app/views//register_page.dart';
import 'package:bmi_calculator_app/components/loading/loading_spinner.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBase _auth = AuthService();

  String email;
  String password;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Platform.isIOS
                      ? Icon(Icons.arrow_back_ios)
                      : Icon(Icons.arrow_back),
                  //Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // SizedBox(
                      //   height: SizeConfig.blockSizeVertical * 5,
                      // ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DelayedDisplay(
                              delay: Duration(milliseconds: 200),
                              child: Text(
                                'Welcome',
                                style: kLabelTextStyleL,
                              ),
                            ),
                            DelayedDisplay(
                              delay: Duration(milliseconds: 300),
                              child: Text(
                                'Back',
                                style: kLabelTextStyleL,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 7,
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            DelayedDisplay(
                              delay: Duration(milliseconds: 400),
                              slidingBeginOffset: Offset(0.35, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kWhiteColor, width: 1.0),
                                  color: kActiveCardColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                width: SizeConfig.blockSizeHorizontal * 80,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      top: 3.0,
                                      bottom: 3.0,
                                      right: 10.0),
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
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DelayedDisplay(
                              delay: Duration(milliseconds: 500),
                              slidingBeginOffset: Offset(0.35, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kWhiteColor, width: 1.0),
                                  color: kActiveCardColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                width: SizeConfig.blockSizeHorizontal * 80,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      top: 3.0,
                                      bottom: 3.0,
                                      right: 10.0),
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
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DelayedDisplay(
                              delay: Duration(milliseconds: 1200),
                              slidingBeginOffset: Offset(0.35, 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  // DO SOMETHING
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: kLightGreyColor,
                                    fontSize: kFontSizeXXS,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3,
                            ),
                            DelayedDisplay(
                              delay: Duration(milliseconds: 1000),
                              slidingCurve: Curves.elasticOut,
                              child: Container(
                                width: SizeConfig.blockSizeHorizontal * 80,
                                child: FlatButton(
                                  splashColor: Colors.pinkAccent,
                                  child: const Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        letterSpacing: 1.5,
                                        fontSize: 20,
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
                                      setState(() => loading = true);
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (user != null) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HistoryPage()));
                                        setState(() {
                                          loading = false;
                                        });
                                      } else {

                                      Platform.isIOS ? showDialog(context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            // backgroundColor: kSoftRedColor,
                                            title: new Text("Login failed"),
                                            content: new Text("Email and/or Password is not filled in correctly"),
                                          insetAnimationDuration: Duration(milliseconds: 100),
                                            actions: <Widget>[
                                              CupertinoDialogAction(child: Text("Try Again"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },)
                                            ]
                                            // actions: <Widget>[
                                            //   new FlatButton(
                                            //     child: new Text("Try again"),
                                            //     onPressed: () {
                                            //       Navigator.of(context).pop();
                                            //     },
                                            //   ),
                                            // ],
                                            );
                                          },
                                        ): showDialog(context: context,
                                        builder: (BuildContext context) {
                                          return CupertinoAlertDialog(
                                            // backgroundColor: kSoftRedColor,
                                            title: new Text("Login failed"),
                                            content: new Text("Email and/or Password is not filled in correctly"),
                                          insetAnimationDuration: Duration(milliseconds: 100),
                                            actions: <Widget>[
                                              CupertinoDialogAction(child: Text("Try Again"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },)
                                            ]
                                            // actions: <Widget>[
                                            //   new FlatButton(
                                            //     child: new Text("Try again"),
                                            //     onPressed: () {
                                            //       Navigator.of(context).pop();
                                            //     },
                                            //   ),
                                            // ],
                                            );
                                          },
                                        );
                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    } catch (e) {
                                      print(e);
                                      loading = false;
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 5,
                            ),
                            Row(children: <Widget>[
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(
                                        left: 40.0, right: 20.0),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 36,
                                    )),
                              ),
                              Text("OR"),
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 40.0),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 36,
                                    )),
                              ),
                            ]),
                            Platform.isIOS
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(FontAwesomeIcons.google),
                                        onPressed: () async {
                                          dynamic result =
                                              await _auth.signInWithGoogle();
                                          if (result != null) {
                                            setState(() {
                                              loading = true;
                                            });
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HistoryPage()));
                                          } else {
                                            setState(() {
                                              loading = false;
                                            });
                                          }
                                        },
                                        iconSize: 30,
                                      ),
                                      IconButton(
                                        icon: Icon(FontAwesomeIcons
                                            .solidQuestionCircle),
                                        onPressed: () async {
                                          dynamic result =
                                              await _auth.signInAnonymously();
                                          if (result == null) {
                                            print('Error signing in');
                                          } else {
                                            print('Signed in');
                                            setState(() {
                                              loading = true;
                                            });
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HistoryPage()));
                                          }
                                          setState(() {
                                            loading = false;
                                          });
                                        },
                                        iconSize: 30 ,
                                      ),
                                      IconButton(
                                        icon: Icon(FontAwesomeIcons.apple),
                                        onPressed: () {},
                                        iconSize: 35,
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(FontAwesomeIcons.google),
                                        onPressed: () async {
                                          //final user = _auth.currentUser();
                                          dynamic result =
                                              await _auth.signInWithGoogle();
                                          if (result != null) {
                                            setState(() {
                                              loading = true;
                                            });
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HistoryPage()));
                                          } else {
                                            setState(() {
                                              loading = false;
                                            });
                                          }
                                        },
                                        iconSize: 30,
                                      ),
                                      IconButton(
                                        icon: Icon(FontAwesomeIcons
                                            .solidQuestionCircle),
                                        onPressed: () async {
                                          dynamic result =
                                              await _auth.signInAnonymously();
                                          if (result == null) {
                                            print('Error signing in');
                                          } else {
                                            print('Signed in');
                                            setState(() {
                                              loading = true;
                                            });
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HistoryPage()));
                                          }
                                          setState(() {
                                            loading = false;
                                          });
                                        },
                                        iconSize: 30,
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: kLightGreyColor,
                                    fontSize: kFontSizeXXS,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 3,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage()));
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: kPinkColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: kFontSizeXS,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
