import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator_app/screens/history_page.dart';
import 'package:bmi_calculator_app/screens/login_page.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/components/cards/reusable_card.dart';
import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/models/user.dart';

//import 'login_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult, this.bmiResultText, this.bmiInterpretation});

  final String bmiResultText;
  final String bmiResult;
  final String bmiInterpretation;

//  final _auth = FirebaseAuth.instance;
  final AuthBase _auth = AuthService();

  final _firestore = Firestore.instance;

  //GET UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: const Text(
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
                      const Text(
                        'Normal BMI range',
                        style: kLabelTextStyleXS,
                      ),
                      const Text(
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
                          child: const Text(
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
                          onPressed: () {
                            if (user == null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            } else {
                              print('This is the uid from the results page: $user.uid');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryPage()));
                            }
                          },
//                          onPressed: () async {
//                            User loggedInUser;
//                            try {
//                              final user = await _auth.currentUser();
//                              if (user != null) {
//                                loggedInUser = user;
//                                final uid = await getCurrentUID();
//                                _firestore.collection('userData').document(uid).collection('bmiResults').add({
//                                  'result': bmiResult,
//                                  'result_text': bmiResultText,
//                                  'user_email': loggedInUser.email,
//                                  'date': Timestamp.now(),
//                                  'interpretation': bmiInterpretation,
//                                });
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => HistoryPage()));
//                              } else {
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => LoginPage()));
//                              }
//                            } catch (e) {
//                              print(e);
//                            }
//                          },
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 1,
                      ),
                      Container(
                        child: const Text(
                          'Requires user account!',
                          style: kLabelTextStyleXXS,
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
                child: const Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 25,
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
