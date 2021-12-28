import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:delayed_display/delayed_display.dart';

import 'package:bmi_calculator_app/components/loading/loading_spinner.dart';
import 'package:bmi_calculator_app/views//login_page.dart';
import 'package:bmi_calculator_app/views//history_page.dart';
import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthBase _auth = AuthService();

  //String username;
  String email;
  String name;
  String password;

  bool loading = false;

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
            appBar: AppBar(
              leading: IconButton(
                  icon: Platform.isIOS
                      ? Icon(Icons.arrow_back_ios)
                      : Icon(Icons.arrow_back),
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
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DelayedDisplay(
                            delay: Duration(milliseconds: 200),
                            child: const Text(
                              'Create',
                              style: kLabelTextStyleL,
                            ),
                          ),
                          DelayedDisplay(
                            delay: Duration(milliseconds: 300),
                            child: const Text(
                              'Account',
                              style: kLabelTextStyleL,
                            ),
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
                          DelayedDisplay(
                            delay: Duration(milliseconds: 400),
                            slidingBeginOffset: Offset(0.35, 0.0),
                            child: Container(
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
                                    name = value;
                                  },
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Your Name',
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
                            height: 30
                          ),
                          DelayedDisplay(
                            delay: Duration(milliseconds: 400),
                            slidingBeginOffset: Offset(0.35, 0.0),
                            child: Container(
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
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DelayedDisplay(
                            delay: Duration(milliseconds: 500),
                            slidingBeginOffset: Offset(0.35, 0.0),
                            child: Container(
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
                            height: 30,
                          ),
                          DelayedDisplay(
                            delay: Duration(milliseconds: 1000),
                            slidingCurve: Curves.elasticOut,
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 80,
                              child: TextButton(style: TextButton.styleFrom(
                                primary: kWhiteColor,
                                backgroundColor: kPinkColor,
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                              ),
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                      letterSpacing: 1.5,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 2.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  try {
                                    setState(() => loading = true);
                                    dynamic newUser = await _auth
                                        .createUserWithEmailAndPassword(
                                            email, password, name);
                                    if (newUser != null) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HistoryPage()));
                                    }
                                  } catch (e) {
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      style: alertStyle,
                                      title: 'registration failed',
                                      desc:
                                          'This e-mail is already used, try again with another e-mail ',
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
                                                        RegisterPage()));
                                          },
                                          //radius: BorderRadius.circular(50.0),
                                          color: kPinkColor,
                                        ),
                                      ],
                                    ).show();
                                    print(e);
                                    loading = false;
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          DelayedDisplay(
                            delay: Duration(milliseconds: 800),
                            child: const Text(
                              'Already have an account',
                              style: TextStyle(
                                color: kLightGreyColor,
                                fontSize: kFontSizeXS,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: DelayedDisplay(
                              delay: Duration(milliseconds: 900),
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  color: kPinkColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: kFontSizeM,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
  }
}
