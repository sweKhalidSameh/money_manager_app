import 'package:flutter/material.dart';
import 'package:money_manager/core/theme/app_colors.dart';
import 'package:money_manager/core/theme/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroudColor;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.focusedBorder,
    this.backgroudColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 16),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.secondaryColor, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
        hintStyle: hintStyle ?? AppTextStyles.balanceAmount,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backgroudColor ?? AppColors.cardBackground,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? AppTextStyles.balanceAmount,
    );
  }
}
