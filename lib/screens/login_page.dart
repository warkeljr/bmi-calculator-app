import 'package:bmi_calculator_app/screens/history_page.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:bmi_calculator_app/screens/register_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator_app/components/loading/loading_spinner.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';
import '../models/size_config.dart';
import '../services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBase _auth = AuthService();

  String email;
  String password;

  bool loading = false;

  //bool _hasInputError = false;

  var alertStyle = AlertStyle(
    titleStyle: TextStyle(
        color: kWhiteColor, fontSize: 30, fontWeight: FontWeight.bold),
    descStyle: TextStyle(color: kLightGreyColor, fontSize: 20),
    backgroundColor: kActiveCardColor,
    overlayColor: Colors.black87,
    animationType: AnimationType.grow,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return loading
        ? Loading()
        : Scaffold(
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
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 5,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Welcome',
                              style: kLabelTextStyleL,
                            ),
                            const Text(
                              'Back',
                              style: kLabelTextStyleL,
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
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kWhiteColor, width: 1.0),
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
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kWhiteColor, width: 1.0),
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
//                            _hasInputError = value.length < 6;
//                            setState(() {
//
//                            });
                                  },
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: TextStyle(letterSpacing: 1.5),
                                    //errorText: _hasInputError ? "Password is to small" : null,
                                    icon: Icon(Icons.lock),
                                  ),
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
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
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3,
                            ),
                            Container(
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
                                    setState(() {
                                      loading = true;
                                    });
                                    final user =
                                        await _auth.signInWithEmailAndPassword(
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
                                    }
                                  } catch (e) {
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      style: alertStyle,
                                      title: 'Login failed',
                                      desc:
                                          'please try again with the correct credentials. If you do not have an account just create one for free.',
                                      buttons: [
                                        DialogButton(
                                          child: const Text(
                                            'Try again',
                                            style: TextStyle(
                                                color: kWhiteColor,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          },
                                          //radius: BorderRadius.circular(50.0),
                                          color: kPinkColor,
                                        ),
                                      ],
                                    ).show();
                                    print(e);
                                    //print('Nothing in the fields is filled in');
                                    loading = false;
                                  }
                                },
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.facebook),
                                  onPressed: () {},
                                  iconSize: 30,
                                ),
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.google),
                                  onPressed: () {},
                                  iconSize: 30,
                                ),
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.twitter),
                                  onPressed: () {},
                                  iconSize: 30,
                                ),
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.github),
                                  onPressed: () {},
                                  iconSize: 30,
                                ),
                              ],
                            ),
                            SizedBox(),
                            Row(
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
                                  width: SizeConfig.blockSizeHorizontal * 1,
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
                                      fontSize: kFontSizeXXS,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InputPage()));
                              },
                              child: const Text(
                                'Skip Log In',
                                style: TextStyle(
                                  color: kLightGreyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
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
