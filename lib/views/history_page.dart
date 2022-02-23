// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:bmi_calculator_app/models/bmi.dart';
import 'package:bmi_calculator_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:bmi_calculator_app/views//input_page.dart';
// import 'package:bmi_calculator_app/services/auth.dart';
// import 'package:bmi_calculator_app/services/database.dart';
// import 'package:bmi_calculator_app/models/bmi.dart';
// import 'package:bmi_calculator_app/components/list/bmi_list.dart';
import 'package:bmi_calculator_app/components/cards/history_card.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
// import 'package:bmi_calculator_app/models/user.dart';

class BmiHistory extends StatefulWidget {
  BmiHistory({Key? key}) : super(key: key);

  @override
  State<BmiHistory> createState() => _BmiHistoryState();
}

class _BmiHistoryState extends State<BmiHistory> {
  List<Object> _bmiHistoryList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUsersBmiList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI History Page'),
        backgroundColor: kAppbarBackgroundColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _bmiHistoryList.length,
          itemBuilder: (context, index) {
            return BmiHistoryCard(_bmiHistoryList[index] as Bmi);
          }
          )
        ),
    );
  }

  Future getUsersBmiList() async {
    final uid = AuthService().currentUserData?.uid;
    var data = await FirebaseFirestore.instance
          .collection('bmiHistory')
          .doc(uid)
          .collection('results')
          .orderBy('date', descending: true)
          .get();

    setState(() {
      _bmiHistoryList = List.from(data.docs.map((doc) => Bmi.fromSnapshot(doc)));
    });      
  }


}
