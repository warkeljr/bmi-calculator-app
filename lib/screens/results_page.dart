//import 'package:bmi_calculator/screens/history_page.dart';
import 'package:bmi_calculator_app/screens/bmi_weight_status.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constants.dart';
import '../components/cards/reusable_card.dart';

//import 'bmi_weight_status.dart';
import '../models/size_config.dart';

//import 'login_page.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult, this.bmiResultText, this.bmiInterpretation});

  final String bmiResult;
  final String bmiResultText;
  final String bmiInterpretation;

//  final _auth = FirebaseAuth.instance;
//  FirebaseUser loggedInUser;

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
//                            final user = await _auth.currentUser();
//                            try {
//                              final user = await _auth.currentUser();
//                              if (user != null) {
//                                loggedInUser = user;
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
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(FontAwesomeIcons.info),
                          tooltip: 'BMI weight status',
                          onPressed: () {
                            print('Icon button was pressed');
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
                    fontWeight: FontWeight.w900,
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
