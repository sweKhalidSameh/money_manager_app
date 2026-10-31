import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/core/utils/email_validator.dart';
import 'package:money_manager/core/utils/password_validator.dart';
import 'package:money_manager/core/widgets/text_form_field.dart';
import 'package:money_manager/features/auth/logic/cubit/sign_up_cubit.dart';
import 'package:money_manager/features/auth/logic/data/auth_repository.dart';
import 'package:money_manager/features/auth/widgets/password_field.dart';
import 'package:money_manager/features/auth/widgets/password_strength_bar.dart';
import 'package:money_manager/features/home/presentation/home_screen.dart';
import 'package:money_manager/l10n/l10n_extension.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SignUpCubit(authRepository: context.read<AuthRepository>()),
      child: BlocConsumer<SignUpCubit, SignUpState>(listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      // Header
                      _buildTopInformation(context),
                      const SizedBox(height: 10),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // First & Last Name
                            Row(
                              children: [
                                Expanded(
                                  child: _buildNameField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return context.l10n.validateFirstName;
                                      }
                                      return null;
                                    },
                                    label: context.l10n.fieldFirstName,
                                    hint: context.l10n.fieldFirstName,
                                    controller: _firstNameController,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _buildNameField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return context.l10n.validateLastName;
                                      }
                                      return null;
                                    },
                                    label: context.l10n.fieldLastName,
                                    hint: context.l10n.fieldLastName,
                                    controller: _lastNameController,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Email
                            _buildLabel(context.l10n.fieldEmail),

                            AppTextFormField(
                              validator: (value) =>
                                  EmailValidator.validate(value, context.l10n),
                              controller: _emailController,
                              hintText: 'example@gmail.com',
                              hintStyle: AppTextStyles.balanceLabel.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 16,
                              ),
                              inputTextStyle: AppTextStyles.bodyText,
                              suffixIcon: Icon(
                                Icons.email,
                                color: AppColors.primaryColor,
                              ),
                            ),

                            const SizedBox(height: 8),
                            _buildLabel(context.l10n.fieldPhone),

                            AppTextFormField(
                              controller: _phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return context.l10n.validatePhoneRequired;
                                } else if (!RegExp(r'^01[0125]\d{8}$')
                                    .hasMatch(value)) {
                                  return context.l10n.validatePhoneInvalid;
                                }
                                return null;
                              },
                              hintText: '01xxxxxxxxx',
                              hintStyle: AppTextStyles.balanceLabel.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 16,
                              ),
                              inputTextStyle: AppTextStyles.bodyText,
                              suffixIcon: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                              ),
                            ),

                            const SizedBox(height: 8),

                            _buildLabel(context.l10n.fieldPassword),

                            PasswordField(
                              validator: (value) =>
                                  PasswordValidator.signUpValidator(
                                      value, context.l10n),
                              controller: _passwordController,
                            ),
                            const SizedBox(height: 8),
                            _buildLabel(context.l10n.fieldConfirmPassword),

                            PasswordField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return context.l10n.validateConfirmPassword;
                                } else if (value != _passwordController.text) {
                                  return context.l10n.validatePasswordsMismatch;
                                }
                                return null;
                              },
                              controller: _confirmPasswordController,
                            ),
                            const SizedBox(height: 8),
                            PasswordStrengthBar(
                                controller: _passwordController),

                            const SizedBox(height: 8),
                            Text(
                              context.l10n.authPasswordRules,
                              style: AppTextStyles.captionText.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Create Account Button
                            _buildCreateAccountButton(context),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // OR
                      _buildOrDivider(context),

                      const SizedBox(height: 20),

                      // Google Sign Up
                      _buildGoogleButton(context),

                      const SizedBox(height: 20),

                      // Login
                      _buildLoginRow(context),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // -------------------------
  Widget _buildNameField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        AppTextFormField(
          controller: controller,
          validator: validator,
          hintText: hint,
          hintStyle: AppTextStyles.balanceLabel.copyWith(
            color: AppColors.textSecondary,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          inputTextStyle: AppTextStyles.bodyText,
        ),
      ],
    );
  }

  // -------------------------
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, bottom: 8),
      child: Text(text, style: AppTextStyles.cardSubtitle),
    );
  }

  // -------------------------
  Widget _buildCreateAccountButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final cubit = context.read<SignUpCubit>();
          if (_formKey.currentState!.validate()) {
            cubit.signUp(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              email: _emailController.text,
              phone: _phoneController.text,
              password: _passwordController.text,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_add, color: Colors.black),
            const SizedBox(width: 8),
            Text(
              context.l10n.authCreateAccount,
              style: AppTextStyles.bodyText.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------
  Widget _buildOrDivider(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(context.l10n.authOr, style: AppTextStyles.cardSubtitle),
        ),
        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
      ],
    );
  }

  // -------------------------
  Widget _buildGoogleButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<SignUpCubit>().signUpWithGoogle();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.cardBackground,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/google_icon.svg'),
            const SizedBox(width: 8),
            Text(context.l10n.authSignUpWithGoogle, style: AppTextStyles.bodyText),
          ],
        ),
      ),
    );
  }

  // -------------------------
  Widget _buildLoginRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.l10n.authHaveAccount, style: AppTextStyles.bodyText),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            context.l10n.authLogin,
            style: AppTextStyles.bodyText.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

// -------------------------
// Header
// -------------------------

Widget _buildTopInformation(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.cardBackground,
        ),
        padding: const EdgeInsets.only(top: 10, bottom: 4, right: 10, left: 10),
        child: Image.asset('assets/images/Logo.png'),
      ),
      const SizedBox(height: 8),
      Text(context.l10n.appName, style: context.titleStyle.copyWith(fontSize: 18)),
      const SizedBox(height: 3),
      Text(
        context.l10n.authSignupSubtitle,
        textAlign: TextAlign.center,
        style: context.captionStyle.copyWith(fontSize: 14),
      ),
      const SizedBox(height: 20),
    ],
  );
}
