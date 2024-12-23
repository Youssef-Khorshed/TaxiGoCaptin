import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/validation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/presentaion/controller/otp_cubit/otp_cubit.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import '../../../../widgets/costume_bottun.dart';
import '../../../sign_in/presentaion/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context)!.verification_email_or_phone,
            style: AppStyles.text24Size500WightDarkGray,
          ),
          SizedBox(height: 40.h),
          CustomTextField(
validator: (value) {
  Validation.validatePhone(value, context);
},
              controller:  OtpCubit.get(context).controller ,
              onChanged: (value) => {}, label:AppLocalizations.of(context)!.email_or_phone_number),
          const Spacer(),
          BlocConsumer<OtpCubit, OtpState>(
  listener: (context, state) {
    if(state is ForgetPassSuccess){
      Navigator.pushNamed(context, Routes.otpScreen,arguments: OtpCubit.get(context).controller?.text);

    }
    else if(state is ForgetPassFailure){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error??"Error")));
    }
  },

  builder: (context, state) {
    if(state is ForgetPassLoading){
      return CustomLoading();
    }
    return SizedBox(
            width: 400.w,
            height: 60.h,
            child: CostumeButton(
              onPressed: () {
                OtpCubit.get(context).forgetPassword(context, OtpCubit.get(context).controller?.text??"");
              //  Navigator.pushNamed(context, Routes.otpScreen);
              },
              color: AppColors.kblue,
              text: AppLocalizations.of(context)!.send_otp,
              textColor: AppColors.kWhite,
            ),
          );
  },
)
        ],
      ),
    );
  }
}
