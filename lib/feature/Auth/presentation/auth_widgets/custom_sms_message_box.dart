import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/text_styles/styles.dart';

class CustomSmsMessageBox extends StatelessWidget {
  const CustomSmsMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blueColor, width: 1),
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.whiteColor),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.blueColor, width: 1.5.w),
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(60.r),
                ),
              ),
              child: SizedBox(
                height: 20.h,
                width: 20.w,
                child: const Icon(
                  Icons.message,
                  color: AppColors.blueColor,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                AppLocalizations.of(context)!.viaSMS,
                style: AppStyles.style16WhiteW500
                    .copyWith(color: AppColors.grayColor),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: AutoSizeText(
                  "***** ***790",
                  style: AppStyles.style14BlackW500
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
