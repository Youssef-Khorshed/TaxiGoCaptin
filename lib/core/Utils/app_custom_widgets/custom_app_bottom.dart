import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/colors.dart';
import '../text_styles/styles.dart';

class CustomAppBottom extends StatelessWidget {
  final String? buttonText;
  final double? width;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor, borderColor, iconColor;
  final bool hasIcon;
  final IconData? icon;

  final double? borderCornerRadius;
  const CustomAppBottom({
    this.borderColor,
    this.textColor,
    this.hasIcon = false,
    this.borderCornerRadius,
    this.buttonText,
    this.buttonColor,
    required this.onPressed,
    super.key,
    this.width,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor ?? AppColors.blueColor,
              borderRadius: BorderRadius.circular(borderCornerRadius ?? 20.r),
              border: Border.all(
                  color: borderColor ?? Colors.transparent, width: .6.w)),
          height: 52.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hasIcon
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                      child: Icon(
                        icon,
                        size: 20.sp,
                        color: iconColor,
                      ),
                    )
                  : Container(),
              Text(
                buttonText ?? "",
                style: AppStyles.style16WhiteW500.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
