import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/history_page.dart';
import '../screens/register_page.dart';
import '../components/loading/loading_spinner.dart';
import '../constants/constants.dart';
import '../models/size_config.dart';
import '../services/auth.dart';
import '../components/animations/fadeInAnimation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBase _auth = AuthService();

  String email;
  String password;

  bool loading = false;

  Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
  Duration _scaleDuration = Duration(milliseconds: 1000);
  Curve _curve = Curves.elasticOut;

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
                      FadeIn(
                        1.0,
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
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 7,
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            FadeIn(
                              1.5,
                              Container(
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
                            FadeIn(
                              1.8,
                              Container(
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
                            FadeIn(
                              2.3,
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
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3,
                            ),
                            FadeIn(
                              2.8,
                              TweenAnimationBuilder(
                                curve: _curve,
                                tween: _scaleTween,
                                duration: Duration(milliseconds: 1500),
                                builder: (context, scale, child) {
                                  return Transform.scale(
                                    scale: scale,
                                    child: child,
                                  );
                                },
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () async {
                                      try {
                                        setState(() {
                                          loading = true;
                                        });
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
                                        }
                                      } catch (e) {
                                        print(e);
                                        loading = false;
                                      }
                                    },
                                  ),
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
                                          // TODO -> probaly not usefull final user = _auth.currentUser();
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
                                            print(
                                                'This is the uid from the login page: $result.uid');
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
                                      IconButton(
                                  icon: Icon(FontAwesomeIcons.apple),
                                  onPressed: () {},
                                  iconSize: 30,
                                ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(FontAwesomeIcons.google),
                                        onPressed: () async {
                                          final user = _auth.currentUser();
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
                                            print(
                                                'This is the uid from the login page: $result.uid');
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

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
