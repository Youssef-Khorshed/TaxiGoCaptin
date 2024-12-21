import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';
import 'custom_otp_textfield.dart';
import 'custom_resend_code.dart';
import 'otp_header.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: 30.h),
          const OtpHeader(title: 'Forgot Password',
          subTitle: "Code has been sent to***** ***70"),

           SizedBox(height: 32.h),
           const CustomOtpTextField(),
           SizedBox(height: 16.h),
           const CustomResendCode(),
           const Spacer(),
         const CustomButton(text: "Verify"),
           SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

