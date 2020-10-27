import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:delayed_display/delayed_display.dart';

import 'package:bmi_calculator_app/services/auth.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';
import 'package:bmi_calculator_app/screens/bmi_weight_status.dart';
import 'package:bmi_calculator_app/models/user.dart';
import 'package:bmi_calculator_app/screens/oboarding_page.dart';
import 'package:bmi_calculator_app/screens/profile_page.dart';

class Sidemenu extends StatefulWidget {
  @override
  _SidemenuState createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {

  final AuthBase _auth = AuthService();
  

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: kPinkColor,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/angela.png'),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: Center(
                        child: user != null ? Text('Welcome back') : Text('Logged out'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 100),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.user),
              title: Text(
                'My Profile',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
              ),
              onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            ),
          ),
          DelayedDisplay(
            delay: Duration(milliseconds: 300),
            slidingBeginOffset: Offset(-0.35, 0.0),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.history),
              title: Text(
                'BMI History',
                style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
              ),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            color: kPinkColor,
          ),
          SizedBox(
            height: 40.0,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.cog),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.lifeRing),
            title: Text(
              'Help',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.infoCircle),
            title: Text(
              'Info',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BmiWeightStatus()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text(
              'Home',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.signOutAlt),
            title: Text(
              'Sign Out',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
