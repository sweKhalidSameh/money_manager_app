import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/l10n/l10n_extension.dart';
import 'package:money_manager/core/utils/currency_formatter.dart';
import 'package:money_manager/core/widgets/app_progress_bar.dart';
import 'package:money_manager/core/widgets/sparkline_chart.dart';
import 'package:money_manager/features/home/presentation/widgets/stat_card.dart';

/// The 2x2 grid of summary cards:
/// expenses | income on top, investments | savings below (right to left).
class StatsGrid extends StatelessWidget {
  const StatsGrid({
    super.key,
    required this.expenses,
    required this.expensesWeeklyChange,
    required this.expensesTrend,
    required this.income,
    required this.incomeCollectedPercent,
    required this.incomeTrend,
    required this.investments,
    required this.investmentsReturn,
    required this.investmentsAllocation,
    required this.activePortfolios,
    required this.savings,
    required this.savingsGoalName,
    required this.savingsGoalProgress,
    required this.savingsRemaining,
  });

  final double expenses;
  final double expensesWeeklyChange;
  final List<double> expensesTrend;

  final double income;
  final double incomeCollectedPercent;
  final List<double> incomeTrend;

  final double investments;
  final double investmentsReturn;

  /// Portfolio progress bar value from 0.0 to 1.0.
  final double investmentsAllocation;
  final int activePortfolios;

  final double savings;
  final String savingsGoalName;

  /// Goal progress from 0.0 to 1.0.
  final double savingsGoalProgress;
  final double savingsRemaining;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.shopping_bag_outlined,
                  iconColor: AppColors.expense,
                  iconBackground: AppColors.expenseBackground,
                  title: context.l10n.statExpenses,
                  amount: expenses,
                  amountColor: AppColors.expense,
                  footer: _ExpensesFooter(
                    weeklyChange: expensesWeeklyChange,
                    trend: expensesTrend,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: Icons.account_balance_rounded,
                  iconColor: AppColors.secondaryColor,
                  iconBackground: AppColors.incomeBackground,
                  title: context.l10n.statIncome,
                  amount: income,
                  amountColor: AppColors.secondaryColor,
                  footer: _IncomeFooter(
                    collectedPercent: incomeCollectedPercent,
                    trend: incomeTrend,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.stacked_line_chart_rounded,
                  iconColor: AppColors.tertiaryColor,
                  iconBackground: AppColors.goldBackground,
                  title: context.l10n.statInvestments,
                  amount: investments,
                  amountColor: AppColors.tertiaryColor,
                  footer: _InvestmentsFooter(
                    returnPercent: investmentsReturn,
                    allocation: investmentsAllocation,
                    activePortfolios: activePortfolios,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: Icons.savings_outlined,
                  iconColor: AppColors.secondaryColor,
                  iconBackground: AppColors.incomeBackground,
                  title: context.l10n.statSavings,
                  amount: savings,
                  amountColor: AppColors.textPrimary,
                  footer: _SavingsFooter(
                    goalName: savingsGoalName,
                    progress: savingsGoalProgress,
                    remaining: savingsRemaining,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpensesFooter extends StatelessWidget {
  const _ExpensesFooter({required this.weeklyChange, required this.trend});

  final double weeklyChange;
  final List<double> trend;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SparklineChart(points: trend, color: AppColors.expense, height: 36),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              weeklyChange >= 0
                  ? Icons.arrow_drop_up_rounded
                  : Icons.arrow_drop_down_rounded,
              size: 20,
              color: AppColors.expense,
            ),
            Text(
              formatPercent(weeklyChange, showSign: true),
              textDirection: TextDirection.ltr,
              style: AppTextStyles.numberSmall.copyWith(
                color: AppColors.expense,
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                context.l10n.statSinceLastWeek,
                overflow: TextOverflow.ellipsis,
                style: context.captionStyle.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _IncomeFooter extends StatelessWidget {
  const _IncomeFooter({required this.collectedPercent, required this.trend});

  final double collectedPercent;
  final List<double> trend;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SparklineChart(points: trend, color: AppColors.secondaryColor, height: 36),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.arrow_drop_up_rounded,
              size: 20,
              color: AppColors.secondaryColor,
            ),
            Text(
              context.l10n.statStable,
              style: context.captionStyle.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                context.l10n.incomeCollected(collectedPercent.round()),
                overflow: TextOverflow.ellipsis,
                style: context.captionStyle.copyWith(fontSize: 10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InvestmentsFooter extends StatelessWidget {
  const _InvestmentsFooter({
    required this.returnPercent,
    required this.allocation,
    required this.activePortfolios,
  });

  final double returnPercent;
  final double allocation;
  final int activePortfolios;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(context.l10n.investmentsReturn, style: context.captionStyle),
            const SizedBox(width: 4),
            Text(
              formatPercent(returnPercent),
              textDirection: TextDirection.ltr,
              style: AppTextStyles.numberSmall.copyWith(
                color: AppColors.tertiaryColor,
              ),
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 3,
              backgroundColor: AppColors.tertiaryColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        AppProgressBar(value: allocation, color: AppColors.tertiaryColor),
        const SizedBox(height: 8),
        Text(
          context.l10n.activePortfolios(activePortfolios),
          style: context.captionStyle.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}

class _SavingsFooter extends StatelessWidget {
  const _SavingsFooter({
    required this.goalName,
    required this.progress,
    required this.remaining,
  });

  final String goalName;
  final double progress;
  final double remaining;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(goalName, style: context.captionStyle),
            const Spacer(),
            Text(
              '${(progress * 100).round()}%',
              textDirection: TextDirection.ltr,
              style: AppTextStyles.numberSmall.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        AppProgressBar(value: progress, color: AppColors.secondaryColor),
        const SizedBox(height: 8),
        Text(
          context.l10n.savingsRemaining(
          '${formatAmount(remaining)} ${context.l10n.currency}',
        ),
          style: context.captionStyle.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
