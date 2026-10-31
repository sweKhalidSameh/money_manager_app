import 'package:flutter/widgets.dart';
import 'package:money_manager/l10n/app_localizations.dart';

/// Short access to the generated translations: `context.l10n.navHome`.
/// If `flutter gen-l10n` writes the generated file somewhere else on your
/// Flutter version, this import is the only line that needs to change.
extension AppL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
