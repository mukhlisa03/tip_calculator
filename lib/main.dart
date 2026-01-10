import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';

void main() => runApp(const TipCalculatorApp());

class TipCalculatorApp extends StatelessWidget {
  const TipCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tip Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const CalculatorScreen(),
    );
  }
}