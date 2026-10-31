import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/features/home/presentation/widgets/balance_card.dart';
import 'package:money_manager/features/home/presentation/widgets/budget_alert_card.dart';
import 'package:money_manager/features/home/presentation/widgets/greeting_section.dart';
import 'package:money_manager/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:money_manager/features/home/presentation/widgets/home_header.dart';
import 'package:money_manager/features/home/presentation/widgets/section_header.dart';
import 'package:money_manager/features/home/presentation/widgets/stats_grid.dart';
import 'package:money_manager/features/home/presentation/widgets/transaction_filter_chips.dart';
import 'package:money_manager/features/home/presentation/widgets/transaction_tile.dart';
import 'package:money_manager/l10n/l10n_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO(logic): every value below is demo data taken from the Figma design.
    // In the logic step these will come from the HomeCubit state instead.
    // The layout direction (LTR / RTL) comes from the app language, so there
    // is no Directionality here anymore.
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: HomeBottomNav(currentIndex: 0, onTap: (_) {}),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            children: [
              // TODO(logic): pass onLanguageTap once a LocaleCubit exists.
              const HomeHeader(hasUnreadNotifications: true),
              const SizedBox(height: 20),
              GreetingSection(userName: l10n.demoUserName, score: 85),
              const SizedBox(height: 20),
              BalanceCard(
                balance: 142500,
                changePercent: 8.4,
                changeAmount: 11050,
                previousMonthName: l10n.demoPreviousMonth,
              ),
              const SizedBox(height: 16),
              BudgetAlertCard(
                categoryName: l10n.demoBudgetCategory,
                monthName: l10n.demoBudgetMonth,
                remainingAmount: 350,
                usedPercent: 85,
              ),
              const SizedBox(height: 16),
              StatsGrid(
                expenses: 12400,
                expensesWeeklyChange: 4,
                expensesTrend: const [3, 4, 3.5, 4.2, 3.8, 4.6, 5],
                income: 28000,
                incomeCollectedPercent: 100,
                incomeTrend: const [2, 3, 2.6, 3.4, 4, 3.8, 5],
                investments: 65000,
                investmentsReturn: 12.3,
                investmentsAllocation: 0.7,
                activePortfolios: 3,
                savings: 37100,
                savingsGoalName: l10n.demoGoalName,
                savingsGoalProgress: 0.75,
                savingsRemaining: 12900,
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: l10n.recentTransactions,
                actionLabel: l10n.viewAll,
              ),
              const SizedBox(height: 12),
              TransactionFilterChips(
                filters: [
                  l10n.filterAll,
                  l10n.filterExpenses,
                  l10n.filterIncome,
                  l10n.filterInvestments,
                ],
              ),
              const SizedBox(height: 14),
              TransactionTile(
                icon: Icons.payments_outlined,
                iconColor: AppColors.secondaryColor,
                iconBackground: AppColors.incomeBackground,
                title: l10n.demoTx1Title,
                subtitle: l10n.demoTx1Subtitle,
                amount: 25000,
                categoryLabel: l10n.demoTx1Category,
                categoryColor: AppColors.textSecondary,
              ),
              const SizedBox(height: 10),
              TransactionTile(
                icon: Icons.stacked_line_chart_rounded,
                iconColor: AppColors.tertiaryColor,
                iconBackground: AppColors.goldBackground,
                title: l10n.demoTx2Title,
                subtitle: l10n.demoTx2Subtitle,
                amount: -3500,
                categoryLabel: l10n.demoTx2Category,
                categoryColor: AppColors.tertiaryColor,
              ),
              const SizedBox(height: 10),
              TransactionTile(
                icon: Icons.shopping_bag_outlined,
                iconColor: AppColors.expense,
                iconBackground: AppColors.expenseBackground,
                title: l10n.demoTx3Title,
                subtitle: l10n.demoTx3Subtitle,
                amount: -850,
                categoryLabel: l10n.demoTx3Category,
                categoryColor: AppColors.tertiaryColor,
              ),
              const SizedBox(height: 10),
              TransactionTile(
                icon: Icons.local_cafe_outlined,
                iconColor: AppColors.textSecondary,
                iconBackground: AppColors.neutralBackground,
                title: l10n.demoTx4Title,
                subtitle: l10n.demoTx4Subtitle,
                amount: -45,
                categoryLabel: l10n.demoTx4Category,
                categoryColor: AppColors.tertiaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
