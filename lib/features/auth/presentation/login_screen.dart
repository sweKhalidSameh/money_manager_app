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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Scaffold(
                    body: Center(
                      child: Text(
                          'HOME PAGE'), //TODO: Replace with your home page widget
                    ),
                  ),
                ),
              );
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
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(height: 100),
                              _buildTopInformation(),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Email',
                                        style: AppTextStyles.cardSubtitle,
                                      ),
                                    ),
                                    AppTextFormField(
                                      validator: EmailValidator.validate,
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
                                        'Password',
                                        style: AppTextStyles.cardSubtitle,
                                      ),
                                    ),
                                    // password field
                                    PasswordField(
                                      validator:
                                          PasswordValidator.loginValidator,
                                      controller: _passwordController,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            // Handle forgot password logic here
                                          },
                                          child: Text(
                                            'Forgot Password?',
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
                                                context
                                                    .read<LoginCubit>()
                                                    .login(
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                    );
                                              }
                                            },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.secondaryColor,
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
                                                  'Login',
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      'OR',
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
                                      'Sign in with Google',
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
                                    "Don't have an account? ",
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
                                      'Sign Up',
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
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

Widget _buildTopInformation() {
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
      Text('Money Manager', style: AppTextStyles.cardTitle),
      SizedBox(height: 3),
      Text(
        "Welcome back! Please login to your account.",
        style: AppTextStyles.cardSubtitle,
      ),
      SizedBox(height: 20),
    ],
  );
}
