// Concrete implementations of operations
import 'package:flutter_calculator/operations/operation.dart';

class Subtraction extends Operation {
  @override
  double operate(double operand1, double operand2) {
    return operand1 - operand2;
  }
}
