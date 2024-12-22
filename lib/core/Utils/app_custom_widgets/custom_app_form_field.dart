import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../colors/colors.dart';

class CustomAppFormField extends StatefulWidget {
  final String? hintText;
  final bool obscureText, isPassword, isPhone, isNumbers;
  final Widget? iconWidget, prefixIcon, suffixIcon;
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
      this.isPhone = false,
      this.isNumbers = false,
      this.suffixIcon});

  @override
  State<CustomAppFormField> createState() => _CustomAppFormFieldState();
}

class _CustomAppFormFieldState extends State<CustomAppFormField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && isPasswordHidden,
        keyboardType:
            widget.isNumbers ? TextInputType.number : TextInputType.text,
        validator: widget.validator,
        onTap: widget.onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(width: .5.w, color: AppColors.whiteColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: .5.w),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor, width: .5.w),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor, width: .15.w),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
          errorMaxLines: 1,
          errorStyle: AppStyles.style16WhiteW500
              .copyWith(fontSize: 14.sp, color: AppColors.redColor),
          icon: widget.iconWidget,
          hintText: widget.hintText,
          hintStyle: AppStyles.style16GrayW500,
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
              : widget.suffixIcon,
          prefixIcon: widget.isPhone
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: AutoSizeText(
                    "+964",
                    style: AppStyles.style14BlackW500,
                  ),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: widget.prefixIcon,
                ),
        ),
      ),
    );
  }
}
