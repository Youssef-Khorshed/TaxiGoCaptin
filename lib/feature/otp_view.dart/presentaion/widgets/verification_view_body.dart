import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/custom_text_field.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import '../../../../widgets/costume_bottun.dart';

class ConfirmMobileOrEmail extends StatelessWidget {
  const ConfirmMobileOrEmail({
    super.key,
    required this.emailOrPhoneController,
  });

  final TextEditingController emailOrPhoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Verification email or phone number',
            style: AppStyles.text24Size500WightDarkGray,
          ),
          SizedBox(height: 40.h),
          CustomTextField(
              onChanged: (value) => {}, label: 'Enter Your Phone Or Email'),
          const Spacer(),
          SizedBox(
            width: 400.w,
            height: 60.h,
            child: CostumeButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.otpScreen);
              },
              color: AppColors.kblue,
              text: "Send  OTP",
              textColor: AppColors.kWhite,
            ),
          )
        ],
      ),
    );
  }
}
