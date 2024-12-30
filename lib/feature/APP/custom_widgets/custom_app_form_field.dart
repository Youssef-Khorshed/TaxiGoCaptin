import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../core/Utils/assets/icons.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/spacing/vertspace.dart';

class CustomAppFormField extends StatefulWidget {
  final String? hintText;
  final bool obscureText, isPassword, isPhone, isNumbers;
  final Widget? iconWidget, prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextStyle? hintStyle;

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
        this.hintStyle,
        required this.isNumbers,
        this.suffixIcon});

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
      keyboardType: widget.isPhone ? TextInputType.phone : TextInputType.text,
      validator: widget.validator,
      onTap: widget.onTap,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelStyle: AppStyles.style16WhiteW500.copyWith(
          fontSize: 15.sp,
          color: AppColors.redColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blueColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grayColor, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        errorMaxLines: 1,
        errorStyle: AppStyles.style16WhiteW500
            .copyWith(fontSize: 14.sp, color: AppColors.redColor),
        icon: widget.iconWidget,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            AppStyles.style16WhiteW500
                .copyWith(color: AppColors.grayColor, fontSize: 12.sp),
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
            : widget.isPhone &&
            Localizations.localeOf(context).languageCode == 'ar'
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.countryCode,
                style: AppStyles.style15Blue,
              ),
              SizedBox(width: 5.w),
              Container(
                width: 1.w,
                height: 20.h,
                color: AppColors.grayColor,
              ),
              SizedBox(width: 5.w),
              SvgPicture.asset(
                AppIcons.iconsIraq,
                width: 20.w,
              ),
              horizontalSpace(5.w),
            ],
          ),
        )
            : null,
        prefixIcon: widget.isPhone &&
            Localizations.localeOf(context).languageCode == 'en'
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpace(5.w),
              SvgPicture.asset(
                AppIcons.iconsIraq,
                width: 20.w,
              ),
              horizontalSpace(5.w),
              Container(
                width: 1.w,
                height: 20.h,
                color: AppColors.grayColor,
              ),
              horizontalSpace(5.w),
              Text(
                AppLocalizations.of(context)!.countryCode,
                style: AppStyles.style15Blue,
              ),
            ],
          ),
        )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      ),
      style: AppStyles.style16WhiteW500.copyWith(
        color: Colors.black,
      ),
    );
  }
}
