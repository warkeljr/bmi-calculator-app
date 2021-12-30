import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/models/user.dart';
import 'package:bmi_calculator_app/views/bmi_weight_status.dart';
import 'package:bmi_calculator_app/views/onboarding_page.dart';
import 'package:bmi_calculator_app/views/profile_page.dart';
import 'package:bmi_calculator_app/views/history_page.dart';
import 'package:bmi_calculator_app/views/login_page.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final AuthBase _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserMod?>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: kPinkColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/angela.png'),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Center(
                          child: FutureBuilder<dynamic>(
                                  future: _auth.getCurrentUserInfo(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    final userSnapshot = snapshot.data;
                                    if (snapshot.hasData) {
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: AutoSizeText(
                                            'Welcome ${userSnapshot.displayName}',
                                            maxLines: 2,
                                          ),
                                        );
                                    } else {
                                      return Text('Please Login');
                                    }
                                  })),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 50),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.user),
              title: Text(
                'My Profile',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 150),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.history),
              title: Text(
                'BMI History',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2),
              ),
              onTap: () {
                if (user != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HistoryPage()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            color: kPinkColor,
          ),
          SizedBox(
            height: 10.0,
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 250),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.cog),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 350),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.lifeRing),
              title: Text(
                'Help',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnboardingPage()));
              },
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 450),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.infoCircle),
              title: Text(
                'Info',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BmiWeightStatus()));
              },
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 550),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 650),
            slidingBeginOffset: Offset(0.0, 0.35),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.signOutAlt),
              title: Text(
                user != null
                    ? 'Sign Out'
                    : ''
                        'Sign In',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical! * 2),
              ),
              onTap: () {
                if (user != null) {
                  _auth.signOut();
                  Navigator.pop(context);
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget ProfileInfo(context, snapshot) {
//   final user = Provider.of<User>(context);
//   final AuthBase _auth = AuthService();
//   final userSnapshot = snapshot.data;

//   return Row();
// }
