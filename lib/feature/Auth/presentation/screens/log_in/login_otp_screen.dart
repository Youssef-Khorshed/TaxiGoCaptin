import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../APP/custom_widgets/custom_app_bottom.dart';
import '../../controller/otp_cubit/otp_cubit.dart';

class LoginOtpScreen extends StatefulWidget {
  LoginOtpScreen({super.key, required this.phone});
  String phone;

  @override
  State<LoginOtpScreen> createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  String? otp;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(children: [
                  Icon(
                    FontAwesomeIcons.angleLeft,
                    color: Colors.black,
                    size: 25.r,
                  ),
                  horizontalSpace(5),
                  Text(AppLocalizations.of(context)!.back,
                      style: AppStyles.textStyle20)
                ]),
              ),
              verticalSpace(30),
              Text(
                AppLocalizations.of(context)!.phoneVerification,
                style: AppStyles.style24WhiteW500
                    .copyWith(color: Colors.black),
              ),
              Text(AppLocalizations.of(context)!.enterOTPCode,
                  style: AppStyles.style16WhiteW500
                      .copyWith(color: AppColors.grayColor)),
              verticalSpace(15),
              PinCodeTextField(
                appContext: context,
                length: 5,
                onChanged: (value) {
                  otp = value;
                },
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              verticalSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.didNotReceiveCode,
                    style: AppStyles.style16WhiteW500
                        .copyWith(color: AppColors.grayColor),
                  ),
                  horizontalSpace(5),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                        AppLocalizations.of(context)!.resend_again,
                        style: AppStyles.style16WhiteW500
                            .copyWith(color: AppColors.blueColor)),
                  ),
                ],
              ),
              const Spacer(),
              CustomAppBottom(
                buttonText: AppLocalizations.of(context)!.verify,
                onPressed: () async {
                  await OtpCubit.get(context).forgotPasswordCheckCode(context,
                      code: int.parse(otp ?? "0"), phone: widget.phone);
                  setState(() {});
                  // Navigator.pushNamed(context, AppRoutes.generalScreen);
                },
              ),
              verticalSpace(15)
            ],
          ),
        ),
      ),
    );
  }
}
