import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/l10n/l10n_extension.dart';
import 'package:money_manager/core/utils/currency_formatter.dart';
import 'package:money_manager/core/widgets/icon_badge.dart';

/// One row in the recent transactions list.
/// [amount] is always a positive value. [isIncome] decides the sign
/// ('+' in green for income, '-' for expenses and investments).
class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isIncome,
    required this.categoryLabel,
    required this.categoryColor,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final double amount;
  final bool isIncome;
  final String categoryLabel;
  final Color categoryColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cardBackground,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: AppColors.cardBorder),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              IconBadge(
                icon: icon,
                color: iconColor,
                background: iconBackground,
                size: 46,
                iconSize: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.labelStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.captionStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${isIncome ? '+' : '-'}${formatAmount(amount.abs())}',
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.numberMedium.copyWith(
                          color: isIncome
                              ? AppColors.secondaryColor
                              : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(context.l10n.currency, style: context.captionStyle),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    categoryLabel,
                    style: context.captionStyle.copyWith(
                      fontSize: 10,
                      color: categoryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
