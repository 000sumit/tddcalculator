import 'dart:collection';

import 'package:tddcalculator/core/errors/exceptions.dart';

class AddNumbers {
  int? call(String numbers) {
    if (numbers.isEmpty) return 0;
    String delimiterPattern = r'[,\n]';
    String numberSection = numbers;

    // Check for custom delimiter syntax at the beginning: //;\n1;2
    if (numbers.startsWith('//')) {
      final delimiterEndIndex = numbers.indexOf('\n');
      final customDelimiter = numbers.substring(2, delimiterEndIndex);
      delimiterPattern = RegExp.escape(customDelimiter); // escape special chars
      numberSection = numbers.substring(delimiterEndIndex + 1);
    }

    final parts = numbers.split(RegExp(delimiterPattern));
    final parsedNumbers = parts.map((e) => int.tryParse(e) ?? 0).toList();

    // Check for negative numbers
    final negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw NegativeNumberException(negatives);
    }

    return parsedNumbers.fold(0, (sum, n) => sum! + n);
  }
}
