import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator_app/models/bmi.dart';
import 'package:bmi_calculator_app/services/api_path.dart';




abstract class Database {
  // Future deleteData();
  Future updateUserData(String bmiResultText, String bmiResult, String bmiInterpretation);
  Future addUserData(String bmiResultText, String bmiResult, String bmiInterpretation, String date);
  // Future deleteUserData();
}

class DatabaseService implements Database {
   DatabaseService({@required this.uid});
   final String? uid;

   final CollectionReference bmiResults =
      FirebaseFirestore.instance.collection('bmiHistory');

  @override
  Future updateUserData(
      String bmiResultText, String bmiResult, String bmiInterpretation) async {
    return await bmiResults.doc(uid).collection('results').add({
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation,
      'date': Timestamp.now()
    });
  }

  @override
  Future addUserData(String? bmiResultText, String? bmiResult,
      String? bmiInterpretation, String? date) async {
    return await bmiResults.doc(uid).collection('results').add({
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation,
      'date': Timestamp.now()
    });
  }

  // Future deleteUserData() {}

  Future<void>createBmi(Bmi bmi) async {
    final path = APIPath.bmi(uid!);
    final documentReference = FirebaseFirestore.instance.doc(path!);
    await documentReference.set(bmi.toJson());
  }


   //Bmi list from snapshot
  List<Bmi> _bmiListFromSnapShot(QuerySnapshot snapShot) {
    return snapShot.docs.map((doc) {
      return Bmi(
          bmiResultText: doc['bmiResultText'] ?? '',
          bmiResult: doc['bmiResult'] ?? '',
          bmiInterpretation: doc['bmiInterpretation'] ?? '');
    }).toList();
  }

  // Get bmiResults stream
  Stream<List<Bmi>> get bmiHistory {
    return bmiResults.snapshots().map(_bmiListFromSnapShot);
  }
}

