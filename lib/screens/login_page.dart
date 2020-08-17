import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator_app/screens/history_page.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:bmi_calculator_app/screens/register_page.dart';
import 'package:bmi_calculator_app/components/loading/loading_spinner.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/components/animations/screenTitleAnimation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBase _auth = AuthService();

  String email;
  String password;

  bool loading = false;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  var alertStyle = AlertStyle(
    titleStyle: TextStyle(
        color: kWhiteColor, fontSize: 30, fontWeight: FontWeight.bold),
    descStyle: TextStyle(color: kLightGreyColor, fontSize: 20),
    backgroundColor: kActiveCardColor,
    overlayColor: Colors.black87,
    animationType: AnimationType.grow,
  );

  Tween<double> _scaleTween =Tween<double>(begin: 0, end: 1);
  Duration _scaleDuration = Duration(milliseconds: 1000);
  Curve _curve = Curves.elasticOut;

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
                            ScreenTitle(text:'Welcome'),
                            ScreenTitle(text:'Back'),
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
                            TweenAnimationBuilder(
                              curve: _curve,
                              tween: _scaleTween,
                              duration: Duration(milliseconds: 1500),
                              builder: (context, scale, child) {
                                return Transform.scale(scale: scale, child: child,);
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
                            Row(/**/
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TweenAnimationBuilder(
                                  curve: _curve,
                                  tween: _scaleTween,
                                  duration: Duration(milliseconds: 500),
                                  builder: (context, scale, child) {
                                    return Transform.scale(scale: scale, child: child,);
                                  },
                                  child: IconButton(
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
                                ),
                                TweenAnimationBuilder(
                                  curve: _curve,
                                  tween: _scaleTween,
                                  duration: Duration(milliseconds: 500),
                                  builder: (context, scale, child) {
                                    return Transform.scale(scale: scale, child: child,);
                                  },
                                  child: IconButton(
                                    icon: Icon(
                                        FontAwesomeIcons.solidQuestionCircle),
                                    onPressed: () async {
                                      dynamic result =
                                          await _auth.signInAnonymously();
                                      if (result == null) {
                                        print('Error signing in');
                                      } else {
                                        print('Signed in');
                                        print('This is the uid from the login page: $result.uid');
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
                                ),
                                TweenAnimationBuilder(
                                  curve: _curve,
                                  tween: _scaleTween,
                                  duration: Duration(milliseconds: 500),
                                  builder: (context, scale, child) {
                                    return Transform.scale(scale: scale, child: child,);
                                  },
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.apple),
                                    onPressed: () {},
                                    iconSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
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
                                  width: SizeConfig.blockSizeHorizontal * 2,
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
                              height: 30,
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
