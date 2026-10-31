import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/utils/password_validator.dart';
import 'package:money_manager/l10n/l10n_extension.dart';

class PasswordStrengthBar extends StatelessWidget {
  final TextEditingController controller;
  const PasswordStrengthBar({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final password = value.text;
        final strength = PasswordValidator.checkPasswordStrength(password);
        Color color;
        String text;

        if (password.isEmpty) {
          return SizedBox.shrink();
        }
        switch (strength) {
          case PasswordStrength.veryWeak:
            color = AppColors.error;
            text = context.l10n.strengthVeryWeak;
            break;
          case PasswordStrength.weak:
            color = AppColors.error;
            text = context.l10n.strengthWeak;
            break;
          case PasswordStrength.fair:
            color = AppColors.warning;
            text = context.l10n.strengthFair;
            break;
          case PasswordStrength.good:
            color = AppColors.warning;
            text = context.l10n.strengthGood;
            break;
          case PasswordStrength.strong:
            color = AppColors.success;
            text = context.l10n.strengthStrong;
            break;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(5),
              value: (strength.index + 1) / PasswordStrength.values.length,
              backgroundColor: AppColors.cardBackground,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 5,
            ),
            SizedBox(height: 4),
            Text(
              context.l10n.passwordStrengthLabel(text),
              style: TextStyle(color: color),
            ),
          ],
        );
      },
    );
  }
}
