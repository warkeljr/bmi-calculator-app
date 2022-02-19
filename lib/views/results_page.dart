
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator_app/views/history_page.dart';
import 'package:bmi_calculator_app/views/login_page.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/components/cards/reusable_card.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/models/user.dart';
import 'package:bmi_calculator_app/components/animations/screenTitleAnimation.dart';
import 'package:bmi_calculator_app/services/database.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(
      {@required this.bmiResult, this.bmiResultText, this.bmiInterpretation, this.date});

  final String? bmiResultText;
  final String? bmiResult;
  final String? bmiInterpretation;
  final String? date;

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {

  Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
  Duration _scaleDuration = Duration(milliseconds: 1500);
  Curve _curve = Curves.elasticOut;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserMod?>(context);

    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppbarBackgroundColor,

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
                  TweenAnimationBuilder<double>(
                    curve: _curve,
                    tween: _scaleTween,
                    duration: _scaleDuration,
                    builder: (context, scale, child) {
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: Text(
                      widget.bmiResultText!.toUpperCase(),
                      style: kResultTextStyleGreen,
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    curve: _curve,
                    tween: _scaleTween,
                    duration: _scaleDuration,
                    builder: (context, scale, child) {
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: Text(
                      widget.bmiResult!.toUpperCase(),
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
                          widget.bmiInterpretation!,
                          style: kLabelTextStyleM,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 5,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.blockSizeHorizontal! * 50,
                        child: TweenAnimationBuilder<double>(
                          curve: _curve,
                          tween: _scaleTween,
                          duration: _scaleDuration,
                          builder: (context, scale, child) {
                            return Transform.scale(scale: scale, child: child);
                          },
                          child: TextButton(style: TextButton.styleFrom(
                            primary: kWhiteColor,
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 13.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),),
                          ),
                            child: const Text(
                              'SAVE RESULT',
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontSize: kFontSizeXS,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              try {
                                if (user != null) {
                                  await DatabaseService(uid: user.uid)
                                      .addUserData(
                                    widget.bmiResult,
                                    widget.bmiResultText,
                                    widget.bmiInterpretation,
                                    widget.date,
                                  );
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
                              } catch (e) {
                                print(e);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 1,
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
              height: SizeConfig.blockSizeVertical! * 10,
            ),
          ),
        ],
      ),
    );
  }
}
