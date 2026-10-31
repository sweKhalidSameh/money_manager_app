import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/l10n/l10n_extension.dart';
import 'package:money_manager/core/utils/currency_formatter.dart';
import 'package:money_manager/core/widgets/app_progress_bar.dart';
import 'package:money_manager/core/widgets/icon_badge.dart';

/// Warning card shown when a budget category is close to its limit.
class BudgetAlertCard extends StatelessWidget {
  const BudgetAlertCard({
    super.key,
    required this.categoryName,
    required this.monthName,
    required this.remainingAmount,
    required this.usedPercent,
    this.onDetailsTap,
  });

  final String categoryName;
  final String monthName;
  final double remainingAmount;

  /// Used share of the budget from 0 to 100.
  final double usedPercent;
  final VoidCallback? onDetailsTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IconBadge(
            icon: Icons.notifications_none_rounded,
            color: AppColors.tertiaryColor,
            background: AppColors.goldBackground,
            size: 44,
            iconSize: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.budgetAlertTitle,
                      style: context.labelStyle.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${usedPercent.round()}%',
                      textDirection: TextDirection.ltr,
                      style: AppTextStyles.numberMedium.copyWith(
                        color: AppColors.tertiaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.budgetAlertMessage(
                    categoryName,
                    monthName,
                    '${formatAmount(remainingAmount)} ${context.l10n.currency}',
                  ),
                  style: context.captionStyle.copyWith(height: 1.6),
                ),
                const SizedBox(height: 12),
                AppProgressBar(
                  value: usedPercent / 100,
                  color: AppColors.tertiaryColor,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: _DetailsButton(onTap: onDetailsTap),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsButton extends StatelessWidget {
  const _DetailsButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.goldBackground,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.budgetDetails,
                style: context.captionStyle.copyWith(
                  color: AppColors.tertiaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_rounded,
                size: 14,
                color: AppColors.tertiaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
