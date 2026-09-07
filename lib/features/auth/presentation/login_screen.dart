import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/widgets/text_form_field.dart';
import 'package:money_manager/features/auth/logic/cubit/login_cubit.dart';
import 'package:money_manager/features/auth/widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(0, -0.7),
                        radius: 0.5,
                        colors: [
                          AppColors.primaryColor.withValues(alpha: 0.35),
                          AppColors.backgroundColor,
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          _buildTopInformation(),
                          ElevatedButton(
                            onPressed: () {
                              // Todo later
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
                                SvgPicture.asset('assets/svgs/google_icon.svg'),
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
                                  'email & password',
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
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Email',
                                    style: AppTextStyles.cardSubtitle,
                                  ),
                                ),
                                AppTextFormField(
                                  controller: context
                                      .read<LoginCubit>()
                                      .emailController,
                                  hintText: 'example@gmail.com',
                                  hintStyle: AppTextStyles.balanceLabel
                                      .copyWith(color: AppColors.textSecondary),
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
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Password',
                                    style: AppTextStyles.cardSubtitle,
                                  ),
                                ),
                                // password field
                                PasswordField(
                                  controller: context
                                      .read<LoginCubit>()
                                      .passwordController,
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // Handle forgot password logic here
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: AppTextStyles.bodyText.copyWith(
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle login logic here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.secondaryColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.login, color: Colors.black),
                                      SizedBox(width: 8),
                                      Text(
                                        'Login',
                                        style: AppTextStyles.bodyText.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                  // TODO: Handle sign up logic here
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
    );
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
