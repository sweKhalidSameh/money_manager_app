import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/l10n/l10n_extension.dart';

/// Top row: brand at the start, notifications and avatar at the end.
/// (Start is the right side in Arabic and the left side in English.)
///
/// The language chip only appears when [onLanguageTap] is provided, so the
/// header stays exactly like the design until a language switcher is wired.
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.hasUnreadNotifications = false,
    this.onNotificationsTap,
    this.onAvatarTap,
    this.onLanguageTap,
  });

  final bool hasUnreadNotifications;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onLanguageTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/Logo.png',
            width: 36,
            height: 36,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            context.l10n.appName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.titleStyle.copyWith(
              fontSize: 20,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        const Spacer(),
        if (onLanguageTap != null) ...[
          _LanguageChip(onTap: onLanguageTap!),
          const SizedBox(width: 4),
        ],
        GestureDetector(
          onTap: onNotificationsTap,
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.textPrimary,
                  size: 24,
                ),
                if (hasUnreadNotifications)
                  const PositionedDirectional(
                    top: 9,
                    start: 11,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: AppColors.secondaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onAvatarTap,
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.buttonSurface,
            child: Icon(
              Icons.person_rounded,
              color: AppColors.textSecondary,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.chipBackground,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.language_rounded,
                size: 14,
                color: AppColors.secondaryColor,
              ),
              const SizedBox(width: 4),
              Text(
                context.l10n.switchLanguageLabel,
                style: context.captionStyle.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
