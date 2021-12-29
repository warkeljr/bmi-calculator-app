import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int? height;
  final int? weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 18.5 && _bmi <= 24.9) {
      return 'Normal';
    } else if (_bmi > 24.9 && _bmi <= 29.9) {
      return 'Slightly overweight';
    } else if (_bmi > 29.9) {
      return 'Heavily overweight';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (_bmi > 18.5 && _bmi <= 24.9) {
      return 'You have a normal body weight. Good job!';
    } else if (_bmi > 24.9 && _bmi <= 29.9) {
      return 'You may lose some weight. Ask your Doctor what to do!';
    } else if (_bmi > 29.9) {
      return 'Your health may be at risk. Do not wait any longer go to your Doctor for advice';
    } else {
      return 'Your body weight is to low. Ask your Doctor what to do!';
    }
  }
}
