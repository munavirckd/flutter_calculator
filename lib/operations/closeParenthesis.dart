import 'package:flutter_calculator/operations/operation.dart';

class CloseParenthesis extends Operation {
  @override
  double operate(double operand1, double operand2) {
    // This operation doesn't perform any calculation
    // It is used to indicate the closing parenthesis
    return operand2;
  }
}
