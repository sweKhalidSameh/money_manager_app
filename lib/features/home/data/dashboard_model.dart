import 'package:money_manager/features/home/data/transaction_model.dart';

class DashboardModel {
  final double balance;
  final double changePercent;
  final double totalIncome;
  final double totalExpense;
  final List<double> trendList;
  final List<double> incomeTrendList;
  final String budgetAlertCard;
  final String previousMonthName;
  final List<TransactionModel> transactions;
  final List<String> statsGrid;

  DashboardModel({
    required this.balance,
    required this.changePercent,
    required this.totalIncome,
    required this.totalExpense,
    required this.trendList,
    required this.budgetAlertCard,
    required this.transactions,
    required this.statsGrid,
    required this.incomeTrendList,
    required this.previousMonthName,
  });
}
