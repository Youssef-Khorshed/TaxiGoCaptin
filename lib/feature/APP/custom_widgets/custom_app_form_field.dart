import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../core/Utils/colors/colors.dart';


class CustomAppFormField extends StatefulWidget {
  final String? hintText;
  final bool obscureText, isPassword, isPhone;
  final Widget? iconWidget, prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const CustomAppFormField(
      {super.key,
      required this.hintText,
      this.obscureText = false,
      this.isPassword = false,
      this.iconWidget,
      this.controller,
      this.validator,
      this.onTap,
      this.prefixIcon,
      this.isPhone = false});

  @override
  State<CustomAppFormField> createState() => _CustomAppFormFieldState();
}

class _CustomAppFormFieldState extends State<CustomAppFormField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && isPasswordHidden,
      keyboardType: TextInputType.text,
      validator: widget.validator,
      onTap: widget.onTap,
      decoration: InputDecoration(
        labelStyle: AppStyles.style16WhiteW500.copyWith(
          fontSize: 15,
          color: AppColors.grayColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blackColor, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueColor, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorMaxLines: 1,
        errorStyle: AppStyles.style16WhiteW500
            .copyWith(fontSize: 14, color: AppColors.redColor),
        icon: widget.iconWidget,
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(isPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
                onPressed: () {
                  isPasswordHidden = !isPasswordHidden;
                  setState(() {});
                },
              )
            : null,
        prefixIcon: widget.isPhone
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "+964",
                  style: AppStyles.textStyle14,
                ),
              )
            : null,
      ),
    );
  }
}
