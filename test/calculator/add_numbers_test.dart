import 'package:flutter_test/flutter_test.dart';
import 'package:tddcalculator/features/calculator/domain/usecases/add_numbers.dart';

void main() {
  final calculator = AddNumbers();
  test('return 0 for empty String) ', () {
    expect(calculator(''), 0);
  });
}
