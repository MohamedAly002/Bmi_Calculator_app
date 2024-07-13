import 'package:bmi_calculator/BMI_Calculator_Widget.dart';
import 'package:bmi_calculator/ResultScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Bmi Calculator",
    initialRoute: CalculatorScreen.routeName,
    routes: {
      CalculatorScreen.routeName:(_) => CalculatorScreen(),
    },
  ));
}
