import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.isPassword = false,
    this.suffixIcon,
    this.controller,this.validator
  });
 final TextEditingController? controller;
 final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword && _obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: widget.suffixIcon,
        labelText: widget.label,
        labelStyle: AppStyles.text16Size500WightBlack,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.kHintTextField,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: AppColors.kHintTextField,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
