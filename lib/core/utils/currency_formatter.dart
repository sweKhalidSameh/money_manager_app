/// Formats a number with thousands separators: 142500 -> "142,500".
/// Pass [showSign] to get a leading "+" for positive values.
String formatAmount(num value, {bool showSign = false}) {
  final isNegative = value < 0;
  final digits = value.abs().round().toString();
  final grouped = digits.replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => ',',
  );
  final sign = isNegative ? '-' : (showSign ? '+' : '');
  return '$sign$grouped';
}

/// Formats a percentage with one decimal: 8.4 -> "+8.4%".
String formatPercent(double value, {bool showSign = true}) {
  final sign = value >= 0 ? (showSign ? '+' : '') : '-';
  return '$sign${value.abs().toStringAsFixed(1)}%';
}
