import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/l10n/app_localizations.dart';
import 'package:money_manager/l10n/l10n_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/features/auth/logic/data/auth_repository.dart';
import 'package:money_manager/features/auth/presentation/login_screen.dart';
import 'package:money_manager/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => context.l10n.appName,
        // English and Arabic. The app follows the device language until a
        // LocaleCubit passes an explicit `locale:` here.
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          colorScheme: ColorScheme.dark(
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
            error: AppColors.error,
            tertiary: AppColors.tertiaryColor,
          ),
          textTheme: GoogleFonts.plusJakartaSansTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
