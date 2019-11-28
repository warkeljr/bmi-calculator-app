//import 'package:bmi_calculator/screens/history_page.dart';
//import 'package:bmi_calculator/screens/login_page.dart';
import 'package:bmi_calculator_app/screens/history_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/models/size_config.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final _auth = FirebaseAuth.instance;
  
 FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

 void getCurrentUser() async {
   final user = await _auth.currentUser();
   try {
     final user = await _auth.currentUser();
     if (user != null) {
       loggedInUser = user;
       print(loggedInUser.email);
     }
   } catch (e) {
     print(e);
   }
 }

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
                      //decoration: kMyBoxDecoration(),
                    ),
//                    SizedBox(
//                      width: SizeConfig.blockSizeHorizontal * 5,
//                    ),
                    Flexible(
                      flex: 3,
                      child: FutureBuilder(
                          future: FirebaseAuth.instance.currentUser(),
                        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                            if (snapshot.hasData) {
                              return Text('Welcome....');
                            }
                            else {
                              return Text('Not logged in');
                            }
                        },
                      ),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPage()));
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
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
