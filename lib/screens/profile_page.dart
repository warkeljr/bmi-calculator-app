import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/models/user.dart';
import 'package:bmi_calculator_app/components/cards/reusable_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthBase _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<dynamic>(
        future: _auth.getCurrentUserInfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot != null) {
              return displayUserInformation(context, snapshot);
            } else {
              return Text('No info available');
            }
          } else {
            return Text('No user logged in!');
          }
        },
      ),
    );
  }
}

Widget displayUserInformation(context, snapshot) {
  final user = Provider.of<User>(context);
  final userSnapshot = snapshot.data;
  final AuthBase _auth = AuthService();

  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DelayedDisplay(
          delay: Duration(milliseconds: 200),
          child: const Text(
            'Your',
            style: kLabelTextStyleL,
          ),
        ),
        DelayedDisplay(
          delay: Duration(milliseconds: 300),
          child: const Text(
            'Profile',
            style: kLabelTextStyleL,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              DelayedDisplay(
                delay: Duration(milliseconds: 200),
                slidingBeginOffset: Offset(-0.35, -0.0),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  height: SizeConfig.blockSizeVertical * 25,
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Center(
                      child: CircleAvatar(
                        radius: SizeConfig.blockSizeHorizontal * 15,
                        backgroundImage: AssetImage('images/angela.png'),
                      ),
                    ),
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 200),
                slidingBeginOffset: Offset(0.35, 0.0),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  height: SizeConfig.blockSizeVertical * 25,
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hello ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: kLabelTextStyleXS),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Text(
                            '${userSnapshot.displayName}',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 3.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        DelayedDisplay(delay: Duration(milliseconds: 500),
          child: Expanded(
            child: Container(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2
                          ),
                          Text(
                            'Email',
                            style: kLabelTextStyleXS,
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Text(
                            '${userSnapshot.email}',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 3.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              DelayedDisplay(
                delay: Duration(milliseconds: 200),
                slidingBeginOffset: Offset(-0.35, -0.0),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  height: SizeConfig.blockSizeVertical * 25,
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Created ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: kLabelTextStyleXS),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Text(
                            '${userSnapshot.metadata.creationTime}',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(milliseconds: 200),
                slidingBeginOffset: Offset(0.35, 0.0),
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  height: SizeConfig.blockSizeVertical * 25,
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hello ',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: kLabelTextStyleXS),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Text(
                            '${userSnapshot.metadata.creationTime}',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
//        Expanded(
//          flex: 1,
//          child: ReusableCard(
//            colour: kActiveCardColor,
//            cardChild: Center(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: CircleAvatar(
//                      radius: 50.0,
//                      backgroundImage: AssetImage('images/angela.png'),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: Text('Hello ${userSnapshot.displayName}',
//                    style: kLabelTextStyleXS),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: Text('Email: ${userSnapshot.email}',
//                        style: kLabelTextStyleXS),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: Text('Created: ${userSnapshot.metadata.creationTime}',
//                        style: kLabelTextStyleXS),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
        GestureDetector(
          onTap: () {
            if (user != null) {
              _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            } else {
              print('Sign in');
            }
          },
          child: Container(
            color: kPinkColor,
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            child: Center(
                child: user != null
                    ? Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
            width: double.infinity,
            height: SizeConfig.blockSizeVertical * 10,
          ),
        ),
      ],
    ),
  );
}
