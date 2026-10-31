import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/utils/email_validator.dart';
import 'package:money_manager/core/utils/password_validator.dart';
import 'package:money_manager/core/widgets/text_form_field.dart';
import 'package:money_manager/features/auth/logic/cubit/login_cubit.dart';
import 'package:money_manager/features/auth/logic/data/auth_repository.dart';
import 'package:money_manager/features/auth/presentation/signup_screen.dart';
import 'package:money_manager/features/auth/widgets/password_field.dart';
import 'package:money_manager/features/home/presentation/home_screen.dart';
import 'package:money_manager/l10n/l10n_extension.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            LoginCubit(authRepository: context.read<AuthRepository>()),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final isLoading = state is LoginLoading;
              return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                body: Stack(
                  children: [
                    SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            _buildTopInformation(context),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      context.l10n.fieldEmail,
                                      style: AppTextStyles.cardSubtitle,
                                    ),
                                  ),
                                  AppTextFormField(
                                    validator: (value) =>
                                        EmailValidator.validate(value, context.l10n),
                                    controller: _emailController,
                                    hintText: 'example@gmail.com',
                                    hintStyle: AppTextStyles.balanceLabel
                                        .copyWith(
                                            color: AppColors.textSecondary),
                                    contentPadding:
                                        EdgeInsetsDirectional.symmetric(
                                      horizontal: 12,
                                      vertical: 16,
                                    ),
                                    inputTextStyle: AppTextStyles.bodyText,
                                    suffixIcon: Icon(
                                      Icons.email,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      context.l10n.fieldPassword,
                                      style: AppTextStyles.cardSubtitle,
                                    ),
                                  ),
                                  // password field
                                  PasswordField(
                                    validator: (value) =>
                                        PasswordValidator.loginValidator(
                                            value, context.l10n),
                                    controller: _passwordController,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          // Handle forgot password logic here
                                        },
                                        child: Text(
                                          context.l10n.authForgotPassword,
                                          style:
                                              AppTextStyles.bodyText.copyWith(
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context.read<LoginCubit>().login(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.secondaryColor,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                    child: isLoading
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                CircularProgressIndicator(
                                                  color: Colors.black,
                                                )
                                              ])
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.login,
                                                  color: Colors.black),
                                              SizedBox(width: 8),
                                              Text(
                                                context.l10n.authLogin,
                                                style: AppTextStyles.bodyText
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    context.l10n.authOr,
                                    style: AppTextStyles.cardSubtitle,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                context.read<LoginCubit>().loginWithGoogle();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.cardBackground,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/svgs/google_icon.svg'),
                                  SizedBox(width: 8),
                                  Text(
                                    context.l10n.authSignInWithGoogle,
                                    style: AppTextStyles.bodyText,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  context.l10n.authNoAccount,
                                  style: AppTextStyles.bodyText,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    context.l10n.authSignUp,
                                    style: AppTextStyles.bodyText.copyWith(
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

Widget _buildTopInformation(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.cardBackground,
        ),
        padding: const EdgeInsets.only(top: 10, bottom: 4, right: 10, left: 10),
        child: Image.asset('assets/images/Logo.png'),
      ),
      SizedBox(height: 8),
      Text(context.l10n.appName, style: context.titleStyle.copyWith(fontSize: 18)),
      SizedBox(height: 3),
      Text(
        context.l10n.authWelcomeBack,
        textAlign: TextAlign.center,
        style: context.captionStyle.copyWith(fontSize: 14),
      ),
      SizedBox(height: 20),
    ],
  );
}
