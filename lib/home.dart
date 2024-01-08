import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator.dart';
import 'package:flutter_calculator/operations/addition.dart';
import 'package:flutter_calculator/operations/closeParenthesis.dart';
import 'package:flutter_calculator/operations/multiplication.dart';
import 'package:flutter_calculator/operations/subtraction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          // Example usage
          Calculator calculator = Calculator();
          calculator.addNumber(1);
          calculator.addOperation(Addition());
          calculator.addNumber(3);
          calculator.addOperation(Subtraction());
          calculator.addNumber(4);

          double result = calculator.calculate();
          print('Result: $result'); // Output: Result: 0.0

          Calculator calculator2 = Calculator();
          calculator2.addNumber(1);
          calculator2.addOperation(Addition());
          calculator2.openParenthesis();
          calculator2.addNumber(3);
          calculator2.addOperation(Multiplication());
          calculator2.addNumber(4);
          calculator2.closeParenthesis();

          double result2 = calculator2.calculate();
          print('Result 2: $result2'); // Output: Result 2: 13.0
        },
        child: Text("Start"),
      )),
    );
  }
}
