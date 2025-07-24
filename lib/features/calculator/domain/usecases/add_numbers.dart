import 'dart:collection';

class AddNumbers {
  int? call(String numbers) {
    if (numbers.isEmpty) return 0;

    final parts = numbers.split('');
    final parsedNumbers = parts.map((e) => int.tryParse(e) ?? 0).toList();
    final sum = parsedNumbers.fold(0, (sum, num) => sum + num);

    return sum;
  }
}
