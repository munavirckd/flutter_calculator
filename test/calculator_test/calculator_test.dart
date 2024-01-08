import 'package:flutter_calculator/calculator.dart';
import 'package:flutter_calculator/operations/addition.dart';
import 'package:flutter_calculator/operations/division.dart';
import 'package:flutter_calculator/operations/multiplication.dart';
import 'package:flutter_calculator/operations/subtraction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Basic Addition', () {
    Calculator calculator = Calculator();
    calculator.addNumber(2);
    calculator.addOperation(Addition());
    calculator.addNumber(3);

    expect(calculator.calculate(), equals(5));
  });
  test('Basic Subtraction', () {
    Calculator calculator = Calculator();
    calculator.addNumber(7);
    calculator.addOperation(Subtraction());
    calculator.addNumber(4);

    expect(calculator.calculate(), equals(3));
  });

  test('Basic Multiplication', () {
    Calculator calculator = Calculator();
    calculator.addNumber(6);
    calculator.addOperation(Multiplication());
    calculator.addNumber(5);

    expect(calculator.calculate(), equals(30));
  });

  test('Basic Division', () {
    Calculator calculator = Calculator();
    calculator.addNumber(10);
    calculator.addOperation(Division());
    calculator.addNumber(2);

    expect(calculator.calculate(), equals(5));
  });

  test('Expression with Parentheses', () {
    Calculator calculator = Calculator();
    calculator.addNumber(2);
    calculator.addOperation(Addition());
    calculator.openParenthesis();
    calculator.addNumber(3);
    calculator.addOperation(Multiplication());
    calculator.addNumber(4);
    calculator.closeParenthesis();

    expect(calculator.calculate(), equals(14));
  });

  test('Error: Divide by Zero', () {
    Calculator calculator = Calculator();
    calculator.addNumber(5);
    calculator.addOperation(Division());
    calculator.addNumber(0);

    expect(() => calculator.calculate(), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Error: Unmatched Closing Parenthesis', () {
    Calculator calculator = Calculator();
    calculator.addNumber(2);
    calculator.addOperation(Addition());
    calculator.closeParenthesis();

    expect(() => calculator.calculate(), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Error: Invalid Expression', () {
    Calculator calculator = Calculator();
    calculator.addNumber(3);
    calculator.addOperation(Addition());

    expect(() => calculator.calculate(), throwsA(TypeMatcher<ArgumentError>()));
  });
}
