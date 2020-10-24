import 'package:flutter/material.dart';
import 'screens/inputPage.dart';
import 'screens/resultsPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Color(0xFF27262B),
        primaryColor: Color(0xFF1F1F1F),

      ),
      home: InputPage(),
      routes: {
        '/results' : (context) => ResultsPage(),
        '/input' : (context) => InputPage(),
      },
    );
  }
}
