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
}
