import 'package:money_manager/l10n/app_localizations.dart';

enum PasswordStrength { veryWeak, weak, fair, good, strong }

class PasswordValidator {
  static PasswordStrength checkPasswordStrength(String password) {
    int score = 0;

    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password)) score++;
    if (RegExp(r'[a-z]').hasMatch(password)) score++;
    if (RegExp(r'[0-9]').hasMatch(password)) score++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;

    if (score <= 1) return PasswordStrength.veryWeak;
    if (score <= 2) return PasswordStrength.weak;
    if (score <= 3) return PasswordStrength.fair;
    if (score <= 4) return PasswordStrength.good;
    return PasswordStrength.strong;
  }

  static String? signUpValidator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.validatePasswordRequired;
    } else if (value.length < 8) {
      return l10n.validatePasswordMin;
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return l10n.validatePasswordUpper;
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return l10n.validatePasswordLower;
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return l10n.validatePasswordDigit;
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return l10n.validatePasswordSpecial;
    }
    return null;
  }

  static String? loginValidator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.validatePasswordRequired;
    }
    return null;
  }
}
