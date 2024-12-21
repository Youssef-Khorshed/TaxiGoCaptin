import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../core/Utils/colors/colors.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      borderRadius: BorderRadius.circular(8),
      focusedBorderColor: AppColors.kPrimaryColor,
      numberOfFields: 5,
      borderColor: const Color(0xFF000000),
      showFieldAsBox: true,
      fieldWidth: 50,
      onCodeChanged: (String code) {},
      onSubmit: (String verificationCode) {
        // Logic for OTP submission
      },
    );
  }
}
