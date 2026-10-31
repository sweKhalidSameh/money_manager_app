import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/core/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle cardAmount = GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle balanceAmount = GoogleFonts.plusJakartaSans(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle balanceLabel = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle cardTitle = GoogleFonts.plusJakartaSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle cardSubtitle = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle bodyText = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static TextStyle captionText = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Home dashboard number styles (JetBrains Mono, the "Emerald Vault" label
  // font). Title/label/caption styles are locale-aware: see the
  // LocalizedTextStyles extension at the bottom of this file.
  static TextStyle numberHero = GoogleFonts.jetBrainsMono(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle numberLarge = GoogleFonts.jetBrainsMono(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle numberMedium = GoogleFonts.jetBrainsMono(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle numberSmall = GoogleFonts.jetBrainsMono(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static TextStyle amountChange({required bool isPositive}) =>
      GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: isPositive ? AppColors.secondaryColor : AppColors.error,
      );
}

/// Locale-aware text styles used by the home dashboard.
/// Arabic uses Cairo (Plus Jakarta Sans has no Arabic glyphs);
/// every other language uses Plus Jakarta Sans.
extension LocalizedTextStyles on BuildContext {
  bool get _isArabic => Localizations.localeOf(this).languageCode == 'ar';

  TextStyle _textStyle(double size, FontWeight weight, Color color) {
    return _isArabic
        ? GoogleFonts.cairo(fontSize: size, fontWeight: weight, color: color)
        : GoogleFonts.plusJakartaSans(
            fontSize: size,
            fontWeight: weight,
            color: color,
          );
  }

  TextStyle get titleStyle =>
      _textStyle(16, FontWeight.w700, AppColors.textPrimary);

  TextStyle get labelStyle =>
      _textStyle(13, FontWeight.w600, AppColors.textPrimary);

  TextStyle get captionStyle =>
      _textStyle(11, FontWeight.w500, AppColors.textSecondary);
}
