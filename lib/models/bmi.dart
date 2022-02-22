import 'package:meta/meta.dart';

class Bmi {

  Bmi( {@required this.bmiResultText, @required this. bmiResult, @required this.bmiInterpretation} );

  final String? bmiResultText;
  final String? bmiResult;
  final String? bmiInterpretation;
  
  Map<String, dynamic> toJson() => {
    'bmiResultText': bmiResultText,
    'bmiResult': bmiResult,
    'bmiInterpretation': bmiInterpretation,
  };

  Bmi.fromSnapshot(snapshot)
    : bmiResultText = snapshot.data()['bmiResultText'],
      bmiResult = snapshot.data()['bmiResult'],
      bmiInterpretation = snapshot.data()['bmiInterpretation'];
}

