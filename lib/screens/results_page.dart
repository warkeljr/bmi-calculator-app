import 'package:bmi_calculator_app/screens/history_page.dart';
import 'package:bmi_calculator_app/screens/bmi_weight_status.dart';
import 'package:bmi_calculator_app/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/components/cards/reusable_card.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'bmi_weight_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult, this.bmiResultText, this.bmiInterpretation});

  final String bmiResultText;
  final String bmiResult;
  final String bmiInterpretation;

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  final _firestore = Firestore.instance;
  
  //GET UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kLabelTextStyleL,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResultText.toUpperCase(),
                    style: kResultTextStyleGreen,
                  ),
                  Text(
                    bmiResult.toUpperCase(),
                    style: kResultTextStyleBigNumber,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Normal BMI range',
                        style: kLabelTextStyleXS,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: kLabelTextStyleM,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          bmiInterpretation,
                          style: kLabelTextStyleM,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 50,
                        child: FlatButton(
                          hoverColor: Colors.yellow,
                          splashColor: Colors.lightBlueAccent,
                          child: Text(
                            'SAVE RESULT',
                            style: TextStyle(
                                letterSpacing: 1.5,
                                fontSize: kFontSizeXS,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.blue,
                          textColor: kWhiteColor,
                          padding: EdgeInsets.symmetric(vertical: 13.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          onPressed: () async {
                            try {
                              final user = await _auth.currentUser();
                              if (user != null) {
                                loggedInUser = user;
                                final uid = await getCurrentUID();
                                _firestore.collection('userData').document(uid).collection('bmiResults').add({
                                  'result': bmiResult,
                                  'result_text': bmiResultText,
                                  'user_email': loggedInUser.email,
                                  'date': Timestamp.now(),
                                  'interpretation': bmiInterpretation,
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HistoryPage()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 1,
                      ),
                      Container(
                        child: Text(
                          'Requires user account!',
                          style: kLabelTextStyleXXS,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          color: kActiveCardColor,
                          borderRadius: BorderRadius.all(Radius.circular(99)),
                          boxShadow: [
                            BoxShadow(
                              color: kActiveCardColorDark,
                              offset: Offset(5.0, 5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: kActiveCardColorLight,
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(FontAwesomeIcons.info),
                              tooltip: 'BMI weight status',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BmiWeightStatus()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kPinkColor,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: kFontSizeM,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              width: double.infinity,
              height: SizeConfig.blockSizeVertical * 10,
            ),
          ),
        ],
      ),
    );
  }
}
