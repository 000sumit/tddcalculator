import 'package:flutter_test/flutter_test.dart';
import 'package:tddcalculator/features/calculator/domain/usecases/add_numbers.dart';

void main() {
  final calculator = AddNumbers();
  test('return 0 for empty String) ', () {
    expect(calculator(''), 0);
  });

  test('returns number for single number input', () {
    expect(calculator('1'), 1);
  });
  test('returns sum for two comma-separated numbers', () {
    expect(calculator('1,5'), 6);
  });

  //Allow the add method to handle any amount of numbers.

  test('returns sum for multiple comma-separated numbers', () {
    expect(calculator('1,2,3'), 6);
  });
  // Allow the add method to handle new lines between numbers
  test('handles newlines as delimiters', () {
    expect(calculator('1\n2,3'), 6);
  });
  //Support different delimiters
  test('supports custom delimiter', () {
    expect(calculator('//;\n1;2'), 3);
  });
  //negative numbers not allowed
  test('throws exception with all negative numbers listed', () {
    final calculator = AddNumbers();
    expect(
      () => calculator('1,-2,-3'),
      throwsA(
        predicate(
          (e) => e.toString() == 'Negative numbers not allowed: -2, -3',
        ),
      ),
    );
  });
}
