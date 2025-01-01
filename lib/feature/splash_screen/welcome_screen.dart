import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../APP/custom_widgets/Custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14129B),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1D1AD8),
              Color(0xFF0F0E72),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(AppImages.welcomeCarImage),
              SizedBox(height: 20.h),
              Text(AppLocalizations.of(context)!.welcome,
                  style: AppStyles.style28WhiteW600),
              Text(
                AppLocalizations.of(context)!
                    .have_a_better_transport_experience,
                style: AppStyles.style20WhiteW600,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomAppBottom(
                        textColor: AppColors.blueColor2,
                        buttonColor: AppColors.whiteColor,
                        borderCornerRadius: 10.r,
                        borderColor: AppColors.whiteColor,
                        buttonText:
                            AppLocalizations.of(context)!.create_an_account,
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                      ),
                    ),
                    verticalSpace(10.h),
                    SizedBox(
                      height: 55.h,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomAppBottom(
                        borderCornerRadius: 12.r,
                        borderColor: AppColors.whiteColor,
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.logIn);
                        },
                        textColor: AppColors.whiteColor,
                        buttonColor: AppColors.transparentColor,
                        buttonText: AppLocalizations.of(context)!.logIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
