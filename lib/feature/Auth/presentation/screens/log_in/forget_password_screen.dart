import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/Core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/Custom_button.dart';
import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../../core/Utils/text_styles/styles.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../auth_widgets/custom_sms_message_box.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: const CustomAuthAppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.forgotPassword,
              style: AppStyles.style24BlackW500,
            ),
            AutoSizeText(
              AppLocalizations.of(context)!.resetPasswordInstruction,
              style: AppStyles.style16WhiteW500
                  .copyWith(color: AppColors.grayColor),
              textAlign: TextAlign.center,
            ),
            verticalSpace(15),
            const CustomSmsMessageBox(),
            const Spacer(),
            CustomAppBottom(
              onPressed: () {
                Navigator.pushNamed(context, Routes.forgetPasswordSendOtp);
              },
              buttonText: AppLocalizations.of(context)!.continues,
            ),
          ],
        ),
      ),
    ));
  }
}
