import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/spacing/vertspace.dart';


class CustomAppBottom extends StatelessWidget {
  final String? buttonText, icon;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor, borderColor, iconColor;
  final bool? hasIcon;

  final double? borderCornerRadius;
  const CustomAppBottom({
    this.icon,
    this.iconColor,
    this.borderColor,
    this.textColor,
    this.hasIcon,
    this.borderCornerRadius,
    this.buttonText,
    this.buttonColor,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderCornerRadius ?? 10),
                color: buttonColor ?? AppColors.blueColor,
                border: Border.all(color: Colors.white, width: 2)),
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hasIcon != null
                    ? hasIcon!
                        ? Icon(
                            Icons.my_location_outlined,
                            size: 20,
                            color: iconColor,
                          )
                        : const SizedBox.shrink()
                    : const SizedBox.shrink(),
                verticalSpace(20),
                Center(
                  child: Text(
                    buttonText ?? "",
                    style: AppStyles.style16WhiteW500
                        .copyWith(color: textColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
