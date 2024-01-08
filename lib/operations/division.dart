import 'package:flutter_calculator/operations/operation.dart';

class Division extends Operation {
  @override
  double operate(double operand1, double operand2) {
    if (operand2 == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return operand1 / operand2;
  }
}
