import 'package:flutter_calculator/operations/openParanthesis.dart';
import 'package:flutter_calculator/operations/operation.dart';

class Calculator {
  List<double> numbers = [];
  List<Operation> operations = [];

  void addNumber(double number) {
    numbers.add(number);
  }

  void addOperation(Operation operation) {
    operations.add(operation);
  }

  void openParenthesis() {
    operations.add(OpenParenthesis());
  }

  void closeParenthesis() {
    while (operations.isNotEmpty && operations.last is! OpenParenthesis) {
      performOperation();
    }

    // Pop the opening parenthesis
    if (operations.isNotEmpty && operations.last is OpenParenthesis) {
      operations.removeLast();
    } else {
      throw ArgumentError('Unmatched closing parenthesis.');
    }
  }

  void performOperation() {
    if (numbers.length < 2 || operations.isEmpty) {
      throw ArgumentError('Invalid expression.');
    }

    double operand2 = numbers.removeLast();
    double operand1 = numbers.removeLast();
    Operation operation = operations.removeLast();

    double result = operation.operate(operand1, operand2);
    numbers.add(result);
  }

  double calculate() {
    while (operations.isNotEmpty) {
      performOperation();
    }

    if (numbers.length == 1) {
      return numbers.first;
    } else {
      throw ArgumentError('Invalid expression.');
    }
  }
}
