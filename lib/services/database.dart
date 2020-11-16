import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi_calculator_app/models/bmi.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // Collection reference

  final CollectionReference bmiResults =
      Firestore.instance.collection('bmiHistory');

  Future updateUserData(
      String bmiResultText, String bmiResult, String bmiInterpretation) async {
    return await bmiResults.document(uid).collection('results').add({
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation,
    });
  }

  Future addUserData(String bmiResultText, String bmiResult,
      String bmiInterpretation, String date) async {
    return bmiResults.document(uid).setData({
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation,
      'date': Timestamp.now()
    });
  }

  // Bmi list from snapshot

  List<Bmi> _bmiListFromSnapShot(QuerySnapshot snapShot) {
    return snapShot.documents.map((doc) {
      return Bmi(
          bmiResultText: doc.data['bmiResultText'] ?? '',
          bmiResult: doc.data['bmiResult'] ?? '',
          bmiInterpretation: doc.data['bmiInterpretation'] ?? '');
    }).toList();
  }

  // Get bmiResults stream
  Stream<List<Bmi>> get bmiHistory {
    return bmiResults.snapshots().map(_bmiListFromSnapShot);
  }
}
