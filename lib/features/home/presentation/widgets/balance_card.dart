import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/l10n/l10n_extension.dart';
import 'package:money_manager/core/utils/currency_formatter.dart';

/// The big gradient card with the net balance and the three quick actions.
class BalanceCard extends StatefulWidget {
  const BalanceCard({
    super.key,
    required this.balance,
    required this.changePercent,
    required this.changeAmount,
    required this.previousMonthName,
    this.onAddTransaction,
    this.onTransfer,
    this.onBudget,
  });

  final double balance;
  final double changePercent;
  final double changeAmount;
  final String previousMonthName;
  final VoidCallback? onAddTransaction;
  final VoidCallback? onTransfer;
  final VoidCallback? onBudget;

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.cardBorder),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.balanceGradientStart,
            AppColors.balanceGradientEnd,
          ],
          stops: [0.0, 0.75],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                context.l10n.balanceTotalNet,
                style: context.captionStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => setState(() => _isHidden = !_isHidden),
                child: Icon(
                  _isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              _ChangePill(percent: widget.changePercent),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                _isHidden ? '••••••' : formatAmount(widget.balance),
                textDirection: TextDirection.ltr,
                style: AppTextStyles.numberHero,
              ),
              const SizedBox(width: 8),
              Text(
                context.l10n.currency,
                style: context.labelStyle.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            // The isolate marks (\u2066 ... \u2069) keep "+11,050 SAR" in the
            // right order inside Arabic sentences.
            context.l10n.balanceComparison(
              widget.previousMonthName,
              '\u2066${formatAmount(widget.changeAmount, showSign: true)} '
              '${context.l10n.currency}\u2069',
            ),
            style: context.captionStyle,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  label: context.l10n.actionAddTransaction,
                  icon: Icons.add_circle_outline_rounded,
                  isPrimary: true,
                  onTap: widget.onAddTransaction,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  label: context.l10n.actionTransfer,
                  icon: Icons.compare_arrows_rounded,
                  onTap: widget.onTransfer,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  label: context.l10n.actionBudget,
                  icon: Icons.tune_rounded,
                  onTap: widget.onBudget,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChangePill extends StatelessWidget {
  const _ChangePill({required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    final isPositive = percent >= 0;
    final color = isPositive ? AppColors.secondaryColor : AppColors.error;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor.withAlpha(120),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isPositive ? Icons.trending_up_rounded : Icons.trending_down_rounded,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            formatPercent(percent),
            textDirection: TextDirection.ltr,
            style: AppTextStyles.numberSmall.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    this.isPrimary = false,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foreground =
        isPrimary ? AppColors.onSecondary : AppColors.textPrimary;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: AppColors.secondaryColor.withAlpha(80),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: isPrimary ? AppColors.secondaryColor : AppColors.buttonSurface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 18, color: foreground),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: context.labelStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: foreground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
