import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../core/Utils/colors/colors.dart';
import '../../core/Utils/routes/routes.dart';
import '../APP/custom_widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'WelcomeScreen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14129B),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            const Spacer(),
            Image.asset('assets/images/car.png'),
             SizedBox(height: 20.h),
            GestureDetector(
              child:  Text(
                AppLocalizations.of(context)!.welcome,
                style: AppStyles.text24Size500Wight
              ),
            ),
             Text(
               AppLocalizations.of(context)!.betterSharingExperience,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 54.h,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signUpRoute);
                },
                height: 50.h,
                child:  CustomText(
                  text: AppLocalizations.of(context)!.createAccount,
                  colorText: AppColors.kblue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  style: AppStyles.textStyle20Blue,
                ),
              ),
            ),
             SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              height: 54.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInRoute);
                },
                height: 50.h,
                child:  CustomText(

                  style: AppStyles.textStyle20,
                  text: AppLocalizations.of(context)!.logIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
