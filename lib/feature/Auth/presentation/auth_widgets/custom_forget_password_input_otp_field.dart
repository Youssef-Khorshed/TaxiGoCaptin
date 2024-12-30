import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/Utils/colors/colors.dart';

class CustomForgetPasswordInputOtpField extends StatelessWidget {
  final Function(String)? onCompleted;
  const CustomForgetPasswordInputOtpField({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 5,
      onChanged: (value) {},
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50.h,
        fieldWidth: 53.w,
        activeFillColor: AppColors.whiteColor,
        selectedFillColor: AppColors.whiteColor,
        inactiveFillColor: AppColors.whiteColor,
        activeColor: AppColors.blueColor,
        selectedColor: AppColors.blueColor,
        inactiveColor: AppColors.grayColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: onCompleted,
    );
  }
}
