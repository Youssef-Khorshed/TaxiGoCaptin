import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_validation_mixins.dart';

import 'custom_text_field.dart';

typedef Validator = String? Function(String?);

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        return ValidationMixin.validatePassword(value);
      },
      controller: widget.controller,
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xffB8B8B8),
              )
            : const Icon(
                Icons.visibility_off,
                color: Color(0xffB8B8B8),
              ),
      ),
      hintText: widget.hintText,
      textInputType: TextInputType.visiblePassword,
    );
  }
}
