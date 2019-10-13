import 'package:bmi_calculator_app/screens/history_page.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:bmi_calculator_app/screens/register_page.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  bool _hasInputError = false;


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
              SizedBox(
                height: SizeConfig.blockSizeVertical * 7,
              ),
              Center(
                child: Column(
                  children: <Widget>[
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
                      height: 30,
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 80,
                      child: FlatButton(
                        splashColor: Colors.pinkAccent,
                        child: Text(
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
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryPage()));
                            }
                          } catch (e) {
                            print(e);
                            //print('Nothing in the fields is filled in');
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // DO SOMETHING
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: kLightGreyColor,
                          fontSize: kFontSizeXXS,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 5,
                    ),
                    Text(
                      'Don\'t have an account yet?',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        'Sign up',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InputPage()));
                      },
                      child: Text(
                        'Skip Log In',
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
        ),
      ),
    );
  }
}
