import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/history_page.dart';
import '../screens/login_page.dart';
import '../constants/constants.dart';
import '../components/cards/reusable_card.dart';
import '../models/size_config.dart';
import '../models/user.dart';
import '../components/animations/screenTitleAnimation.dart';
import '../services/database.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(
      {@required this.bmiResult, this.bmiResultText, this.bmiInterpretation});

  final String bmiResultText;
  final String bmiResult;
  final String bmiInterpretation;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {

  Tween<double> _scaleTween =Tween<double>(begin: 0, end: 1);
  Duration _scaleDuration = Duration(milliseconds: 1500);
  Curve _curve = Curves.elasticOut;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user != null) {
      print('This is the logged in user from the menu ${user.uid}');
    } else {
      print('User is logged out');
    }
    
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
//        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ScreenTitle(text: 'Your Result'),
            ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TweenAnimationBuilder(
                    curve: _curve,
                    tween: _scaleTween,
                    duration: _scaleDuration,
                    builder: (context, scale, child) {
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: Text(
                      widget.bmiResultText.toUpperCase(),
                      style: kResultTextStyleGreen,
                    ),
                  ),
                  TweenAnimationBuilder(
                    curve: _curve,
                    tween: _scaleTween,
                    duration: _scaleDuration,
                    builder: (context, scale, child) {
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: Text(
                      widget.bmiResult.toUpperCase(),
                      style: kResultTextStyleBigNumber,
                    ),
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
                          widget.bmiInterpretation,
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
                        child: TweenAnimationBuilder(
                          curve: _curve,
                          tween: _scaleTween,
                          duration: _scaleDuration,
                          builder: (context, scale, child) {
                            return Transform.scale(scale: scale, child: child);
                          },
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
                            onPressed: () async {
                              try {
                                if (user != null) {
                                  await DatabaseService(uid: user.uid).updateUserData('BMI ok', '300', 'Heavy overweight');
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HistoryPage()));
                              } else {
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                              }
                              } catch(e) {
                                print(e);
                              }
                      
                              
                        
                              // User loggedInUser;
                              // try {
                              //   final user = await _auth.currentUser();
                              //   if (user != null) {
                              //     loggedInUser = user;
                              //     final uid = await getCurrentUID();
                              //     _firestore
                              //         .collection('bmiHistory')
                              //         .document(uid).setData({
                              //       'result': widget.bmiResult,
                              //       'result_text': widget.bmiResultText,
                              //       'user_email': loggedInUser.email,
                              //       'date': Timestamp.now(),
                              //       'interpretation': widget.bmiInterpretation,
                              //     });
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => HistoryPage()));
                              //   } else {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => LoginPage()));
                              //   }
                              // } catch (e) {
                              //   print(e);
                              // }
                            },
                          ),
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
