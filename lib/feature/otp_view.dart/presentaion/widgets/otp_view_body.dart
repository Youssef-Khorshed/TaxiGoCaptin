import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';
import 'custom_otp_textfield.dart';
import 'custom_resend_code.dart';
import 'otp_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          30.verticalSpace,
           OtpHeader(title:AppLocalizations.of(context)!.forgot_password,
          subTitle: "${AppLocalizations.of(context)!.code_sent_to}***** *****"),

          16.verticalSpace,
           const CustomOtpTextField(),
          16.verticalSpace,
           const CustomResendCode(),
           const Spacer(),
          CustomButton(text: AppLocalizations.of(context)!.verify),
16.verticalSpace        ],
      ),
    );
  }
}

