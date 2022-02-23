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
    if (_bmi < 16) {
      return 'Very serious underweight';
    } else if (_bmi >= 16.0 && _bmi <= 16.9) {
      return 'Severely underweight';
    } else if (_bmi >= 17.0 && _bmi <= 18.4) {
      return 'Underweight';
    } else if (_bmi > 18.5 && _bmi <= 24.9) {
      return 'Normal';
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return 'Overweight';
    } else if (_bmi >= 30.0 && _bmi <= 34.9) {
      return 'Obesity class 1';
    } else if (_bmi >=35.0 && _bmi <= 39.9) {
      return 'Obesity class 2';
    } else {
      return 'Obesity class 3';
    }
  }

  String interpretation() {
    if (_bmi < 16) {
      return 'Your health may be at risk. Do not wait any longer go to your Doctor for advice.';
    } else if (_bmi >= 16.0 && _bmi <= 16.9) {
      return 'Your health may be at risk. Do not wait any longer go to your Doctor for advice.';
    } else if (_bmi >= 17.0 && _bmi <= 18.4) {
      return 'Your body weight is to low. Ask your Doctor what to do!';
    } else if (_bmi > 18.5 && _bmi <= 24.9) {
      return 'You have a normal body weight. Good job!';
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return 'You may lose some weight. Ask your Doctor what to do!';
    } else if (_bmi >= 30.0 && _bmi <= 34.9) {
      return 'Your health may be at risk. Do not wait any longer go to your Doctor for advice.';
    } else if (_bmi >=35.0 && _bmi <= 39.9) {
      return 'Your health may be at risk. Do not wait any longer go to your Doctor for advice.';
    } else {
      return 'Your health may be at risk. Do not wait any longer go to your Doctor for advice.';
    }
  }
}

