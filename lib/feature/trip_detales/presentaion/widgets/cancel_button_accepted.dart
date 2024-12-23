import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import '../../../../core/Utils/assets/assets.dart';
import '../../../../core/Utils/colors/colors.dart';

class CancelButtonAccepted extends StatefulWidget {
  const CancelButtonAccepted({
    super.key,
    required this.onCancel,
    required this.width,
    required this.isAccepted,
  });

  final double width;
  final bool isAccepted;
  final VoidCallback onCancel;

  @override
  State<CancelButtonAccepted> createState() => _CancelButtonAcceptedState();
}

class _CancelButtonAcceptedState extends State<CancelButtonAccepted> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isAccepted = !_isAccepted;
          log('Cancellation state: $_isAccepted');
        });
        widget.onCancel();
      },
      child: Container(
        width: widget.width * 0.9,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.kReadCancel,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.iconsCancel,
                width: 24.w,
                height: 24.h,
              ),
              verticalSpace(10.h),
              Text(
                "Cancel Your Booking",
                style: AppStyles.style20WhiteW600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
