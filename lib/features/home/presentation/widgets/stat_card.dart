import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/l10n/l10n_extension.dart';
import 'package:money_manager/core/utils/currency_formatter.dart';
import 'package:money_manager/core/widgets/icon_badge.dart';

/// Reusable summary card: icon, title, amount, and a custom [footer].
/// Used for expenses, income, investments and savings.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.amount,
    required this.amountColor,
    required this.footer,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final double amount;
  final Color amountColor;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: context.captionStyle.copyWith(fontSize: 12),
              ),
              const Spacer(),
              IconBadge(
                icon: icon,
                color: iconColor,
                background: iconBackground,
                size: 36,
                iconSize: 18,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    formatAmount(amount),
                    textDirection: TextDirection.ltr,
                    style: AppTextStyles.numberLarge.copyWith(
                      color: amountColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(context.l10n.currency, style: context.captionStyle),
              ),
            ],
          ),
          const SizedBox(height: 10),
          footer,
        ],
      ),
    );
  }
}
