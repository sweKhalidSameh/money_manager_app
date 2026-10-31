enum TransactionType {
  income,
  expense,
}

enum Investment {
  stocks,
  bonds,
  realEstate,
  mutualFunds,
}

class TransactionModel {
  final String title;
  final String subtitle;
  final double amount;
  final String categoryLabel;
  final TransactionType type;
  final Investment? investmentType;
  final DateTime date;
  final String source;

  const TransactionModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.categoryLabel,
    required this.type,
    this.investmentType,
    required this.date,
    required this.source,
  });
}
