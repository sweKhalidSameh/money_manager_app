// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'ثروتي';

  @override
  String get currency => 'ر.س';

  @override
  String get switchLanguageLabel => 'English';

  @override
  String homeGreeting(String name) {
    return 'مرحباً $name 👋';
  }

  @override
  String get homeSubtitle => 'نظرة شاملة على مستجدات ثروتك اليوم';

  @override
  String get balanceTotalNet => 'إجمالي الرصيد الصافي';

  @override
  String get actionAddTransaction => 'إضافة معاملة';

  @override
  String get actionTransfer => 'تحويل';

  @override
  String get actionBudget => 'ميزانية';

  @override
  String balanceComparison(String month, String change) {
    return 'مقارنة بشهر $month الماضي ($change)';
  }

  @override
  String get budgetAlertTitle => 'تنبيه الميزانية';

  @override
  String budgetAlertMessage(String category, String month, String remaining) {
    return 'اقتربت من استهلاك ميزانية «$category» لشهر $month. متبقي لك $remaining فقط.';
  }

  @override
  String get budgetDetails => 'تفاصيل الميزانية';

  @override
  String get statExpenses => 'المصروفات';

  @override
  String get statIncome => 'الإيرادات';

  @override
  String get statInvestments => 'الاستثمارات';

  @override
  String get statSavings => 'الادخار';

  @override
  String get statSinceLastWeek => 'عن الأسبوع الماضي';

  @override
  String get statStable => 'مستقر';

  @override
  String incomeCollected(int percent) {
    return 'تم تحصيل $percent%';
  }

  @override
  String get investmentsReturn => 'العائد';

  @override
  String activePortfolios(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count محفظة نشطة',
      many: '$count محفظة نشطة',
      few: '$count محافظ نشطة',
      two: 'محفظتان نشطتان',
      one: 'محفظة نشطة واحدة',
      zero: 'لا توجد محافظ نشطة',
    );
    return '$_temp0';
  }

  @override
  String savingsRemaining(String amount) {
    return 'متبقي $amount';
  }

  @override
  String get recentTransactions => 'آخر المعاملات';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get filterAll => 'الكل';

  @override
  String get filterExpenses => 'مصروفات';

  @override
  String get filterIncome => 'إيرادات';

  @override
  String get filterInvestments => 'استثمار';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navBudget => 'الميزانية';

  @override
  String get navAnalytics => 'التحليلات';

  @override
  String get navTransactions => 'المعاملات';

  @override
  String get navInvestments => 'الاستثمار';

  @override
  String get authWelcomeBack => 'أهلاً بعودتك! سجّل الدخول إلى حسابك.';

  @override
  String get authSignupSubtitle => 'أنشئ حسابك وابدأ في إدارة أموالك.';

  @override
  String get fieldEmail => 'البريد الإلكتروني';

  @override
  String get fieldPassword => 'كلمة المرور';

  @override
  String get fieldConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get fieldFirstName => 'الاسم الأول';

  @override
  String get fieldLastName => 'اسم العائلة';

  @override
  String get fieldPhone => 'رقم الهاتف';

  @override
  String get authForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get authLogin => 'تسجيل الدخول';

  @override
  String get authOr => 'أو';

  @override
  String get authSignInWithGoogle => 'تسجيل الدخول عبر Google';

  @override
  String get authSignUpWithGoogle => 'إنشاء حساب عبر Google';

  @override
  String get authNoAccount => 'ليس لديك حساب؟ ';

  @override
  String get authSignUp => 'إنشاء حساب';

  @override
  String get authHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get authCreateAccount => 'إنشاء الحساب';

  @override
  String get authPasswordRules =>
      '8 أحرف على الأقل\nحرف إنجليزي كبير\nحرف إنجليزي صغير\nرقم\nورمز خاص.';

  @override
  String passwordStrengthLabel(String strength) {
    return 'قوة كلمة المرور: $strength';
  }

  @override
  String get strengthVeryWeak => 'ضعيفة جداً';

  @override
  String get strengthWeak => 'ضعيفة';

  @override
  String get strengthFair => 'متوسطة';

  @override
  String get strengthGood => 'جيدة';

  @override
  String get strengthStrong => 'قوية';

  @override
  String get validateFirstName => 'الرجاء إدخال الاسم الأول';

  @override
  String get validateLastName => 'الرجاء إدخال اسم العائلة';

  @override
  String get validatePhoneRequired => 'الرجاء إدخال رقم الهاتف';

  @override
  String get validatePhoneInvalid =>
      'الرجاء إدخال رقم هاتف مصري صحيح يبدأ بـ 010 أو 011 أو 012 أو 015';

  @override
  String get validateConfirmPassword => 'الرجاء تأكيد كلمة المرور';

  @override
  String get validatePasswordsMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get demoUserName => 'أحمد';

  @override
  String get demoPreviousMonth => 'سبتمبر';

  @override
  String get demoBudgetCategory => 'الترفيه والمطاعم';

  @override
  String get demoBudgetMonth => 'أكتوبر';

  @override
  String get demoGoalName => 'هدف الطوارئ';

  @override
  String get demoTx1Title => 'راتب شهري أساسي';

  @override
  String get demoTx1Subtitle => 'اليوم، 09:30 ص • مصرف الراجحي';

  @override
  String get demoTx1Category => 'تحويل سريع';

  @override
  String get demoTx2Title => 'شراء أسهم تقنية';

  @override
  String get demoTx2Subtitle => 'أمس، 02:15 م • محفظة تداول';

  @override
  String get demoTx2Category => 'أصول استثمارية';

  @override
  String get demoTx3Title => 'تموينات السدحان';

  @override
  String get demoTx3Subtitle => '24 أكتوبر • بطاقة مَدَى الفضية';

  @override
  String get demoTx3Category => 'مقاضي منزلية';

  @override
  String get demoTx4Title => 'كافيه برو 99';

  @override
  String get demoTx4Subtitle => '23 أكتوبر • Apple Pay';

  @override
  String get demoTx4Category => 'مطاعم وكافيهات';

  @override
  String get validateEmailRequired => 'البريد الإلكتروني مطلوب.';

  @override
  String get validateEmailInvalid => 'الرجاء إدخال بريد إلكتروني صحيح.';

  @override
  String get validatePasswordRequired => 'كلمة المرور مطلوبة.';

  @override
  String get validatePasswordMin =>
      'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل.';

  @override
  String get validatePasswordUpper =>
      'يجب أن تحتوي كلمة المرور على حرف إنجليزي كبير واحد على الأقل.';

  @override
  String get validatePasswordLower =>
      'يجب أن تحتوي كلمة المرور على حرف إنجليزي صغير واحد على الأقل.';

  @override
  String get validatePasswordDigit =>
      'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.';

  @override
  String get validatePasswordSpecial =>
      'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل.';
}
