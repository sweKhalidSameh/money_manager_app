import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';
import 'package:money_manager/core/widgets/text_form_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: '********',
      hintStyle: AppTextStyles.balanceLabel.copyWith(
        color: AppColors.textSecondary,
      ),
      contentPadding: EdgeInsetsDirectional.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      inputTextStyle: AppTextStyles.bodyText,
      isObscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
