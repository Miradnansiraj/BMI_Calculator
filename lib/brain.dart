import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Brain {
  int height;
  int weight;
  double _bmi;
  Brain({this.height, this.weight});

  double calculateBMI() {
    return _bmi;
  }

  Text getText() {
    _bmi = (weight / ((height / 100) * (height / 100)));
    //    Very severely underweight		15
    //    Severely underweight	15	16
    //    Underweight	16	18.5
    //    Normal (healthy weight)	18.5	25
    //    Overweight	25	30
    //    Obese Class I (Moderately obese)	30	35
    //    Obese Class II (Severely obese)	35	40
    //    Obese Class III (Very severely obese)	40	45
    //    Obese Class IV (Morbidly obese)	45	50
    //    Obese Class V (Super obese)	50	60
    //    Obese Class VI (Hyper obese)	60
    if (_bmi < 15) {
      return Text(
        'Very severely underweight',
        style: redTextStyle,
      );
    } else if (_bmi < 16) {
      return Text(
        'Severely underweight',
        style: greenTextStyle,
      );
    } else if (_bmi < 18.5) {
      return Text(
        'Underweight',
        style: yellowTextStyle,
      );
    } else if (_bmi < 25) {
      return Text(
        'Normal (healthy weight)',
        style: greenTextStyle,
      );
    } else if (_bmi < 30) {
      return Text(
        'Overweight',
        style: yellowTextStyle,
      );
    } else if (_bmi < 35) {
      return Text(
        'Moderately obese',
        style: yellowTextStyle,
      );
    } else if (_bmi < 40) {
      return Text(
        'Severely obese',
        style: redTextStyle,
      );
    } else if (_bmi < 45) {
      return Text(
        'Very severely obese',
        style: redTextStyle,
      );
    } else if (_bmi < 50) {
      return Text(
        'Morbidly obese',
        style: redTextStyle,
      );
    } else if (_bmi < 60) {
      return Text(
        'Super obese',
        style: redTextStyle,
      );
    } else {
      return Text(
        'Hyper obese',
        style: redTextStyle,
      );
    }
  }

  String getPara() {
    if (_bmi < 15) {
      return '''You are too skinny''';
    } else if (_bmi < 16) {
      return '''You are skinny''';
    } else if (_bmi < 18.5) {
      return '''You are slightly skinny''';
    } else if (_bmi < 25) {
      return '''You are Perfectly normal weighted''';
    } else if (_bmi < 30) {
      return '''You are slightly overweight''';
    } else if (_bmi < 35) {
      return '''You are overweighted''';
    } else if (_bmi < 40) {
      return '''You are too fat''';
    } else if (_bmi < 45) {
      return '''You are too fat''';
    } else if (_bmi < 50) {
      return '''You are too fat''';
    } else if (_bmi < 60) {
      return '''You are too fat''';
    } else {
      return '''You are too fat''';
    }
  }
}
