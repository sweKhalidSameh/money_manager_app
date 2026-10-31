import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Money Manager'**
  String get appName;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'SAR'**
  String get currency;

  /// Label of the language toggle. It shows the name of the OTHER language, written in that language.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get switchLanguageLabel;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name} 👋'**
  String homeGreeting(String name);

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A full overview of your wealth today'**
  String get homeSubtitle;

  /// No description provided for @balanceTotalNet.
  ///
  /// In en, this message translates to:
  /// **'Total net balance'**
  String get balanceTotalNet;

  /// No description provided for @actionAddTransaction.
  ///
  /// In en, this message translates to:
  /// **'Add transaction'**
  String get actionAddTransaction;

  /// No description provided for @actionTransfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get actionTransfer;

  /// No description provided for @actionBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get actionBudget;

  /// No description provided for @balanceComparison.
  ///
  /// In en, this message translates to:
  /// **'Compared with last {month} ({change})'**
  String balanceComparison(String month, String change);

  /// No description provided for @budgetAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Budget alert'**
  String get budgetAlertTitle;

  /// No description provided for @budgetAlertMessage.
  ///
  /// In en, this message translates to:
  /// **'You are close to using up your “{category}” budget for {month}. Only {remaining} left.'**
  String budgetAlertMessage(String category, String month, String remaining);

  /// No description provided for @budgetDetails.
  ///
  /// In en, this message translates to:
  /// **'Budget details'**
  String get budgetDetails;

  /// No description provided for @statExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get statExpenses;

  /// No description provided for @statIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get statIncome;

  /// No description provided for @statInvestments.
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get statInvestments;

  /// No description provided for @statSavings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get statSavings;

  /// No description provided for @statSinceLastWeek.
  ///
  /// In en, this message translates to:
  /// **'vs last week'**
  String get statSinceLastWeek;

  /// No description provided for @statStable.
  ///
  /// In en, this message translates to:
  /// **'Stable'**
  String get statStable;

  /// No description provided for @incomeCollected.
  ///
  /// In en, this message translates to:
  /// **'{percent}% collected'**
  String incomeCollected(int percent);

  /// No description provided for @investmentsReturn.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get investmentsReturn;

  /// No description provided for @activePortfolios.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 active portfolio} other{{count} active portfolios}}'**
  String activePortfolios(int count);

  /// No description provided for @savingsRemaining.
  ///
  /// In en, this message translates to:
  /// **'{amount} left'**
  String savingsRemaining(String amount);

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get recentTransactions;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterExpenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get filterExpenses;

  /// No description provided for @filterIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get filterIncome;

  /// No description provided for @filterInvestments.
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get filterInvestments;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get navBudget;

  /// No description provided for @navAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get navAnalytics;

  /// No description provided for @navTransactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get navTransactions;

  /// No description provided for @navInvestments.
  ///
  /// In en, this message translates to:
  /// **'Investments'**
  String get navInvestments;

  /// No description provided for @authWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Please login to your account.'**
  String get authWelcomeBack;

  /// No description provided for @authSignupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account and start managing your money.'**
  String get authSignupSubtitle;

  /// No description provided for @fieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get fieldEmail;

  /// No description provided for @fieldPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get fieldPassword;

  /// No description provided for @fieldConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get fieldConfirmPassword;

  /// No description provided for @fieldFirstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get fieldFirstName;

  /// No description provided for @fieldLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get fieldLastName;

  /// No description provided for @fieldPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get fieldPhone;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get authForgotPassword;

  /// No description provided for @authLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLogin;

  /// No description provided for @authOr.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get authOr;

  /// No description provided for @authSignInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get authSignInWithGoogle;

  /// No description provided for @authSignUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get authSignUpWithGoogle;

  /// No description provided for @authNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account? '**
  String get authNoAccount;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authSignUp;

  /// No description provided for @authHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get authHaveAccount;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get authCreateAccount;

  /// No description provided for @authPasswordRules.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters\nWith an uppercase letter\nA lowercase letter\nA number\nAnd a special character.'**
  String get authPasswordRules;

  /// No description provided for @passwordStrengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Password Strength: {strength}'**
  String passwordStrengthLabel(String strength);

  /// No description provided for @strengthVeryWeak.
  ///
  /// In en, this message translates to:
  /// **'Very Weak'**
  String get strengthVeryWeak;

  /// No description provided for @strengthWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get strengthWeak;

  /// No description provided for @strengthFair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get strengthFair;

  /// No description provided for @strengthGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get strengthGood;

  /// No description provided for @strengthStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strengthStrong;

  /// No description provided for @validateFirstName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first name'**
  String get validateFirstName;

  /// No description provided for @validateLastName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your last name'**
  String get validateLastName;

  /// No description provided for @validatePhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get validatePhoneRequired;

  /// No description provided for @validatePhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Egyptian phone number starting with 010, 011, 012, or 015'**
  String get validatePhoneInvalid;

  /// No description provided for @validateConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get validateConfirmPassword;

  /// No description provided for @validatePasswordsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validatePasswordsMismatch;

  /// DEMO DATA. Delete when HomeCubit provides real data.
  ///
  /// In en, this message translates to:
  /// **'Ahmed'**
  String get demoUserName;

  /// No description provided for @demoPreviousMonth.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get demoPreviousMonth;

  /// No description provided for @demoBudgetCategory.
  ///
  /// In en, this message translates to:
  /// **'Entertainment & dining'**
  String get demoBudgetCategory;

  /// No description provided for @demoBudgetMonth.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get demoBudgetMonth;

  /// No description provided for @demoGoalName.
  ///
  /// In en, this message translates to:
  /// **'Emergency goal'**
  String get demoGoalName;

  /// No description provided for @demoTx1Title.
  ///
  /// In en, this message translates to:
  /// **'Monthly base salary'**
  String get demoTx1Title;

  /// No description provided for @demoTx1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Today, 09:30 AM • Al Rajhi Bank'**
  String get demoTx1Subtitle;

  /// No description provided for @demoTx1Category.
  ///
  /// In en, this message translates to:
  /// **'Quick transfer'**
  String get demoTx1Category;

  /// No description provided for @demoTx2Title.
  ///
  /// In en, this message translates to:
  /// **'Tech stocks purchase'**
  String get demoTx2Title;

  /// No description provided for @demoTx2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, 02:15 PM • Trading portfolio'**
  String get demoTx2Subtitle;

  /// No description provided for @demoTx2Category.
  ///
  /// In en, this message translates to:
  /// **'Investment assets'**
  String get demoTx2Category;

  /// No description provided for @demoTx3Title.
  ///
  /// In en, this message translates to:
  /// **'Al Sadhan Supermarket'**
  String get demoTx3Title;

  /// No description provided for @demoTx3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Oct 24 • Mada Silver card'**
  String get demoTx3Subtitle;

  /// No description provided for @demoTx3Category.
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get demoTx3Category;

  /// No description provided for @demoTx4Title.
  ///
  /// In en, this message translates to:
  /// **'Café Pro 99'**
  String get demoTx4Title;

  /// No description provided for @demoTx4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Oct 23 • Apple Pay'**
  String get demoTx4Subtitle;

  /// No description provided for @demoTx4Category.
  ///
  /// In en, this message translates to:
  /// **'Restaurants & cafés'**
  String get demoTx4Category;

  /// No description provided for @validateEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required.'**
  String get validateEmailRequired;

  /// No description provided for @validateEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get validateEmailInvalid;

  /// No description provided for @validatePasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get validatePasswordRequired;

  /// No description provided for @validatePasswordMin.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long.'**
  String get validatePasswordMin;

  /// No description provided for @validatePasswordUpper.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter.'**
  String get validatePasswordUpper;

  /// No description provided for @validatePasswordLower.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter.'**
  String get validatePasswordLower;

  /// No description provided for @validatePasswordDigit.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one digit.'**
  String get validatePasswordDigit;

  /// No description provided for @validatePasswordSpecial.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character.'**
  String get validatePasswordSpecial;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
