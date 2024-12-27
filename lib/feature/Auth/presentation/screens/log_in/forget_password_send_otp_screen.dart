import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/routes/routes.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../APP/custom_widgets/custom_app_bottom.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../auth_widgets/custom_forget_password_input_otp_field.dart';
class ForgetPasswordSendOtpScreen extends StatelessWidget {
  const ForgetPasswordSendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: const CustomAuthAppBar()),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          child: Column(
            children: [
              verticalSpace(10),
              Text(
                "Forget Password OTP",
                style: AppStyles.text24Size500Wight,
              ),
              Text(
               AppLocalizations.of(context)!.code_sent_to,
                style: AppStyles.style16WhiteW500
                    .copyWith(color: AppColors.grayColor),
                textAlign: TextAlign.center,
              ),
              verticalSpace(25),
              const CustomForgetPasswordInputOtpField(),
              verticalSpace(15),
              InkWell(
                onTap: () {},
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.didNotReceiveCode,
                      style: AppStyles.style16WhiteW500
                          .copyWith(color: AppColors.blackColor),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.resend_again,
                          style: AppStyles.style16WhiteW500
                              .copyWith(color: AppColors.blueColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomAppBottom(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.setNewPassword);
                },
                buttonText:AppLocalizations.of(context)!.verify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
