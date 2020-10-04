import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../screens/input_page.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../components/list/bmi_list.dart';
import '../models/bmi.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final AuthBase _auth = AuthService();

  User _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    User user = await _auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  final items = List<String>.generate(50, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Bmi>>.value(
      value: DatabaseService().bmiHistory,
          child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              IconButton(
                  icon: Icon(FontAwesomeIcons.signOutAlt),
                  onPressed: () {
                    _auth.signOut();

                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => InputPage()));
                  })
            ],
            title: Text('BMI History'),
          ),
          body: BmiList(),
          
          
          //ListView.builder(
          //   itemCount: items.length,
          //   itemBuilder: (context, index) {
          //     final item = items[index];
          //     return Dismissible(
          //       background: Container(
          //         padding: EdgeInsets.only(right: 30),
          //         color: Colors.red,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: [
          //             SizedBox(
          //               width: SizeConfig.blockSizeVertical * 2,
          //             ),
          //             Icon(
          //               Icons.delete,
          //               size: 30,
          //             ),
          //           ],
          //         ),
          //       ),
          //       key: Key(item),
          //       onDismissed: (direction) {
          //         setState(() {
          //           items.removeAt(index);
          //           print('there all ${items.length} left');
          //           Scaffold.of(context).showSnackBar(
          //             SnackBar(
          //               content: Text(
          //                 'Item removed',
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 15,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //               duration: Duration(seconds: 1),
          //               backgroundColor: kPinkColor,
          //             ),
          //           );
          //         });
          //       },
          //       direction: DismissDirection.endToStart,
          //       child: Card(
          //         color: kInactiveCardColor,
          //         child: ListTile(
          //           onTap: () {},
          //           contentPadding: EdgeInsets.only(top: 10, bottom: 10),
          //           leading: Container(
          //             decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               color: Colors.blue,
          //             ),
          //             height: 75,
          //             width: 75,
          //             child: Center(
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text('21,5', style: TextStyle(
          //                   fontSize: 20.0,
          //                 ),),
          //               ),
          //             ),
          //           ),
          //           title: Text(
          //             '${items[index]}',
          //             style: TextStyle(
          //               color: kSoftGreenColor,
          //               fontSize: kFontSizeML,
          //             ),
          //           ),
          //           subtitle: Text(
          //             '12-10-2020',
          //             style: TextStyle(
          //               fontSize: kFontSizeM,
          //             ),
          //           ),
          //           trailing: Icon(Icons.arrow_forward_ios),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
