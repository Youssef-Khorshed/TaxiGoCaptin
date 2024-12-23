import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../core/Utils/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        title:  Text(AppLocalizations.of(context)!.forgotPassword),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
             AppLocalizations.of(context)!.resetPasswordInstruction,
              style: AppStyles.textStyle16
            ),
             SizedBox(height: 20.h),
            ContactOption(
              title:AppLocalizations.of(context)!.viaSMS,
              details: "***** ***70",
              icon: Icons.message,
              onTap: () {
                // Handle SMS option
              },
            ),
            const SizedBox(height: 16),
            ContactOption(
              title: AppLocalizations.of(context)!.viaEmail,
              details: "*****@xyz.com",
              icon: Icons.email,
              onTap: () {
                // Handle Email option
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kblue,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child:  Text(
                AppLocalizations.of(context)!.continues  ,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactOption extends StatelessWidget {
  final String title;
  final String details;
  final IconData icon;
  final VoidCallback onTap;

  const ContactOption({super.key,
    required this.title,
    required this.details,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.kblue),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.kblue),
                 SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style:AppStyles.textStyle18),
                    Text(details, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const Icon(Icons.chevron_right, color: AppColors.kblue),
          ],
        ),
      ),
    );
  }
}
