//import 'package:bmi_calculator/screens/history_page.dart';
//import 'package:bmi_calculator/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/constants.dart';
import '../../models/size_config.dart';
//import '../../screens/info_page.dart';
//import 'package:firebase_auth/firebase_auth.dart';


class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            //color: kPinkColor,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color> [
                    kPinkColor,
                    Colors.pinkAccent
                  ])
              ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/angela.png'),
                      ),
                      decoration: kMyBoxDecoration(),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text(
              'My Profile',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.history),
            title: Text(
              'BMI History',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => HistoryPage()));
            },
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.infoCircle),
            title: Text(
              'Info',
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2),
            ),
            onTap: () {
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => InfoPage()));
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}


