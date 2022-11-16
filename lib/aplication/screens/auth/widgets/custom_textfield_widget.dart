import 'package:flutter/material.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';
import 'package:superclean/aplication/ui/themes/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.obscureText,
    this.icon,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppColors.white,
      style: TextStyles.labelStyle.copyWith(
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        iconColor: AppColors.grey,
        suffixIcon: icon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: AppColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: AppColors.white72,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
