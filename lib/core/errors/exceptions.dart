class NegativeNumberException implements Exception {
  final List<int> negatives;

  NegativeNumberException(this.negatives);

  @override
  String toString() => 'Negative numbers not allowed: ${negatives.join(', ')}';
}
