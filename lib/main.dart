import 'package:flutter/material.dart';

import 'package:bmi_calculator_flutter/screens/calculator_page/calculator_page.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF3D3A4B),
        accentColor: Color(0xFFEB9FEF),
      ),
      home: CalculatorPage(),
    );
  }
}
