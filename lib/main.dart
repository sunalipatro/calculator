import 'package:flutter/material.dart';
import 'package:calculator/calScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 163, 0, 185),
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}
