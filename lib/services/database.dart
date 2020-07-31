import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // Collection reference

  final CollectionReference bmiresults =
      Firestore.instance.collection('BMIHistory');

  Future updateUserData(
      String bmiResultText, String bmiResult, String bmiInterpretation) async {
    return await bmiresults.document(uid).setData({
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation
    });
  }

  // Get bmiresults stream
  Stream<QuerySnapshot> get BMIHistory {
    return bmiresults.snapshots();
  }
}
