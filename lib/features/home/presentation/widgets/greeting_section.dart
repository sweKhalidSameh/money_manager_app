import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/l10n/l10n_extension.dart';

/// Greeting text on the right and the financial score chip on the left.
class GreetingSection extends StatelessWidget {
  const GreetingSection({
    super.key,
    required this.userName,
    required this.score,
  });

  final String userName;

  /// Financial health score from 0 to 100.
  final int score;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.homeGreeting(userName),
                style: context.titleStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 2),
              Text(
                context.l10n.homeSubtitle,
                style: context.captionStyle,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _ScoreChip(score: score),
      ],
    );
  }
}

class _ScoreChip extends StatelessWidget {
  const _ScoreChip({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final filledBars = (score / 20).round().clamp(0, 5).toInt();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.verified_rounded,
            size: 16,
            color: AppColors.secondaryColor,
          ),
          const SizedBox(width: 6),
          Text(
            '$score/100',
            textDirection: TextDirection.ltr,
            style: AppTextStyles.numberSmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < 5; i++)
                Container(
                  width: 3,
                  height: 12,
                  margin: const EdgeInsetsDirectional.only(end: 2),
                  decoration: BoxDecoration(
                    color: i < filledBars
                        ? AppColors.secondaryColor
                        : AppColors.trackColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 6),
          const CircleAvatar(
            radius: 3,
            backgroundColor: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }
}
