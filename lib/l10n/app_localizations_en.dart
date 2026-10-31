// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Money Manager';

  @override
  String get currency => 'SAR';

  @override
  String get switchLanguageLabel => 'العربية';

  @override
  String homeGreeting(String name) {
    return 'Hello, $name 👋';
  }

  @override
  String get homeSubtitle => 'A full overview of your wealth today';

  @override
  String get balanceTotalNet => 'Total net balance';

  @override
  String get actionAddTransaction => 'Add transaction';

  @override
  String get actionTransfer => 'Transfer';

  @override
  String get actionBudget => 'Budget';

  @override
  String balanceComparison(String month, String change) {
    return 'Compared with last $month ($change)';
  }

  @override
  String get budgetAlertTitle => 'Budget alert';

  @override
  String budgetAlertMessage(String category, String month, String remaining) {
    return 'You are close to using up your “$category” budget for $month. Only $remaining left.';
  }

  @override
  String get budgetDetails => 'Budget details';

  @override
  String get statExpenses => 'Expenses';

  @override
  String get statIncome => 'Income';

  @override
  String get statInvestments => 'Investments';

  @override
  String get statSavings => 'Savings';

  @override
  String get statSinceLastWeek => 'vs last week';

  @override
  String get statStable => 'Stable';

  @override
  String incomeCollected(int percent) {
    return '$percent% collected';
  }

  @override
  String get investmentsReturn => 'Return';

  @override
  String activePortfolios(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active portfolios',
      one: '1 active portfolio',
    );
    return '$_temp0';
  }

  @override
  String savingsRemaining(String amount) {
    return '$amount left';
  }

  @override
  String get recentTransactions => 'Recent transactions';

  @override
  String get viewAll => 'View all';

  @override
  String get filterAll => 'All';

  @override
  String get filterExpenses => 'Expenses';

  @override
  String get filterIncome => 'Income';

  @override
  String get filterInvestments => 'Investments';

  @override
  String get navHome => 'Home';

  @override
  String get navBudget => 'Budget';

  @override
  String get navAnalytics => 'Analytics';

  @override
  String get navTransactions => 'Transactions';

  @override
  String get navInvestments => 'Investments';

  @override
  String get authWelcomeBack => 'Welcome back! Please login to your account.';

  @override
  String get authSignupSubtitle =>
      'Create your account and start managing your money.';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldPassword => 'Password';

  @override
  String get fieldConfirmPassword => 'Confirm Password';

  @override
  String get fieldFirstName => 'First Name';

  @override
  String get fieldLastName => 'Last Name';

  @override
  String get fieldPhone => 'Phone';

  @override
  String get authForgotPassword => 'Forgot Password?';

  @override
  String get authLogin => 'Login';

  @override
  String get authOr => 'OR';

  @override
  String get authSignInWithGoogle => 'Sign in with Google';

  @override
  String get authSignUpWithGoogle => 'Sign up with Google';

  @override
  String get authNoAccount => 'Don’t have an account? ';

  @override
  String get authSignUp => 'Sign Up';

  @override
  String get authHaveAccount => 'Already have an account? ';

  @override
  String get authCreateAccount => 'Create Account';

  @override
  String get authPasswordRules =>
      'At least 8 characters\nWith an uppercase letter\nA lowercase letter\nA number\nAnd a special character.';

  @override
  String passwordStrengthLabel(String strength) {
    return 'Password Strength: $strength';
  }

  @override
  String get strengthVeryWeak => 'Very Weak';

  @override
  String get strengthWeak => 'Weak';

  @override
  String get strengthFair => 'Fair';

  @override
  String get strengthGood => 'Good';

  @override
  String get strengthStrong => 'Strong';

  @override
  String get validateFirstName => 'Please enter your first name';

  @override
  String get validateLastName => 'Please enter your last name';

  @override
  String get validatePhoneRequired => 'Please enter your phone number';

  @override
  String get validatePhoneInvalid =>
      'Please enter a valid Egyptian phone number starting with 010, 011, 012, or 015';

  @override
  String get validateConfirmPassword => 'Please confirm your password';

  @override
  String get validatePasswordsMismatch => 'Passwords do not match';

  @override
  String get demoUserName => 'Ahmed';

  @override
  String get demoPreviousMonth => 'September';

  @override
  String get demoBudgetCategory => 'Entertainment & dining';

  @override
  String get demoBudgetMonth => 'October';

  @override
  String get demoGoalName => 'Emergency goal';

  @override
  String get demoTx1Title => 'Monthly base salary';

  @override
  String get demoTx1Subtitle => 'Today, 09:30 AM • Al Rajhi Bank';

  @override
  String get demoTx1Category => 'Quick transfer';

  @override
  String get demoTx2Title => 'Tech stocks purchase';

  @override
  String get demoTx2Subtitle => 'Yesterday, 02:15 PM • Trading portfolio';

  @override
  String get demoTx2Category => 'Investment assets';

  @override
  String get demoTx3Title => 'Al Sadhan Supermarket';

  @override
  String get demoTx3Subtitle => 'Oct 24 • Mada Silver card';

  @override
  String get demoTx3Category => 'Groceries';

  @override
  String get demoTx4Title => 'Café Pro 99';

  @override
  String get demoTx4Subtitle => 'Oct 23 • Apple Pay';

  @override
  String get demoTx4Category => 'Restaurants & cafés';

  @override
  String get validateEmailRequired => 'Email is required.';

  @override
  String get validateEmailInvalid => 'Please enter a valid email address.';

  @override
  String get validatePasswordRequired => 'Password is required.';

  @override
  String get validatePasswordMin =>
      'Password must be at least 8 characters long.';

  @override
  String get validatePasswordUpper =>
      'Password must contain at least one uppercase letter.';

  @override
  String get validatePasswordLower =>
      'Password must contain at least one lowercase letter.';

  @override
  String get validatePasswordDigit =>
      'Password must contain at least one digit.';

  @override
  String get validatePasswordSpecial =>
      'Password must contain at least one special character.';
}
