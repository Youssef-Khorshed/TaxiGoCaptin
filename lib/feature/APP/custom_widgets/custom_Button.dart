import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class CustomAppBottom extends StatelessWidget {
  final String? buttonText;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor, borderColor, iconColor;
  final Icon? icon;
  final double? borderCornerRadius;
  final double? height;
  final double? width;
  const CustomAppBottom({
    this.iconColor,
    this.borderColor,
    this.textColor,
    this.borderCornerRadius,
    this.buttonText,
    this.buttonColor,
    required this.onPressed,
    super.key,
    this.icon,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderCornerRadius ?? 10),
              color: buttonColor ?? AppColors.blueColor,
              border: Border.all(color: borderColor ?? Colors.white, width: 1)),
          width: width ?? double.infinity,
          height: height ?? 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              verticalSpace(20),
              Center(
                child: Text(
                  buttonText ?? "",
                  style: AppStyles.style16WhiteW500.copyWith(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
