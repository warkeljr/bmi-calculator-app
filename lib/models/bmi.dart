
class Bmi {

  Bmi( {this.bmiResultText, this. bmiResult, this.bmiInterpretation} );

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