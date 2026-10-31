import 'package:money_manager/l10n/app_localizations.dart';

class EmailValidator {
  static bool isValid(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  static String? validate(String? value, AppLocalizations l10n) {
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return l10n.validateEmailRequired;
    } else if (!isValid(value)) {
      return l10n.validateEmailInvalid;
    }
    return null;
  }
}
