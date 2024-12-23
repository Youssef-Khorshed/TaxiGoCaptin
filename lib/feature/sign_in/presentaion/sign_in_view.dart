import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/widgets/custom_auth_appbar.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/widgets/sign_in_form.dart';
import '../../../core/Utils/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const CustomAuthAppBar(),
               SizedBox(height: 30.h),

              const SignInForm(),
20.verticalSpace,
              RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.dontHaveAccount,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff5A5A5A),
                  ),
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.sign_up,
                      style: AppStyles.textStyle16,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, Routes.signUpRoute);

                        },
                    ),
                  ],
                ),
              ),
              50.verticalSpace,

            ],
          ),
        ),
      ),
    );
  }
}
