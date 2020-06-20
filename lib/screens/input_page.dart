import 'package:bmi_calculator_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'results_page.dart';

import '../components/cards/reusable_card.dart';
import '../components/icons/icon_content.dart';
import '../constants/constants.dart';
import '../models/calculator_brain.dart';
import '../components/buttons/buttons.dart';
import '../models/size_config.dart';
import '../components/menus/side_menu.dart';


//!!ALERT TESTING
import '../components/alert/login_register_alert.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int height = 180;
  int weight = 60;
  int age = 26;

  void increaseWeight() {
    weight = weight + 1;
  }

  void decreaseWeight() {
    weight = weight - 1;
  }

  void increaseAge() {
    age = age + 1;
  }

  void decreaseAge() {
    age = age - 1;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
              //!ALERT TESTING
              showDialog(context: context, barrierDismissible: false,
              builder: (BuildContext context) {
                  return Alert();
                } 
              );
            },
          ),
        ],
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 50,
                    height: SizeConfig.blockSizeVertical * 25,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 50,
                    height: SizeConfig.blockSizeVertical * 25,
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Height',
                    style: kLabelTextStyleXS,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 8,
                          fontWeight: FontWeight.bold,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyleXS,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius:
                          SizeConfig.blockSizeVertical * 2.5),
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: SizeConfig.blockSizeVertical * 4.5),
                      overlayColor: kPinkOverlayColor,
                      thumbColor: kPinkColor,
                      activeTrackColor: kWhiteColor,
                      inactiveTrackColor: kLightGreyColor,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 240.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Weight',
                          style: kLabelTextStyleXS,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 1.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  decreaseWeight();
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  increaseWeight();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Age',
                          style: kLabelTextStyleXS,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  decreaseAge();
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  increaseAge();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        bmiResultText: calc.getResult(),
                        bmiInterpretation: calc.interpretation(),
                      )));
              //timeStampForSavedValues();
            },
            child: Container(
              color: kPinkColor,
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Center(
                child: FadeAnimatedTextKit(
                  duration: Duration(seconds: 5),
                  text:['CALCULATE YOUR BMI'],
                  textStyle: TextStyle(
                    fontSize: kFontSizeM,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              width: double.infinity,
              //height: kBottomContainerHeight,
              height: SizeConfig.blockSizeVertical * 10,
            ),
          ),
        ],
      ),
      drawer: SideMenu(),
    );
  }
}
