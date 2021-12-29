import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi_calculator_app/models/bmi.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference bmiResults =
      FirebaseFirestore.instance.collection('bmiHistory');

  Future updateUserData(
      String bmiResultText, String bmiResult, String bmiInterpretation) async {
    return await bmiResults.doc(uid).collection('results').add({
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation,
    });
  }

  Future addUserData(String bmiResultText, String bmiResult,
      String bmiInterpretation, String date) async {
    return await bmiResults.doc(uid).collection('results').add({
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation,
      'date': Timestamp.now()
    });
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
