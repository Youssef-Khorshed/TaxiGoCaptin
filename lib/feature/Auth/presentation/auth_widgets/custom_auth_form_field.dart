import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../core/Utils/colors/colors.dart';
class CustomAuthFormField extends StatelessWidget {
  const CustomAuthFormField({
    super.key,
    this.onChanged,
    required this.hintText,
    this.obscureText = false,
  });
  final String hintText;
  final bool? obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText ?? false,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: AppStyles.style16WhiteW500
              .copyWith(fontSize: 15.r, color: AppColors.grayColor,),
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r),),),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blueColor, width: 2.w),
              borderRadius: BorderRadius.all(Radius.circular(8.r),),),
          errorBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.redColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(8.r),),),
          errorMaxLines: 1,
          errorStyle: AppStyles.style16WhiteW500
              .copyWith(fontSize: 14.sp, color: AppColors.redColor),
        ));
  }
}
