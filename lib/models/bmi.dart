import 'package:meta/meta.dart';

class Bmi {

  Bmi( {@required this.bmiResultText, @required this. bmiResult, @required this.bmiInterpretation} );

  final String? bmiResultText;
  final String? bmiResult;
  final String? bmiInterpretation;
  
  Map<String, dynamic>? toMap() {
    return {
      'bmiResultText': bmiResultText,
      'bmiResult': bmiResult,
      'bmiInterpretation': bmiInterpretation,
    };
  }
}

