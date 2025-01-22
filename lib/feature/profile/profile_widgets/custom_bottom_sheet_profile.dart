import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';


void customProfileBottomsheet(BuildContext context) {
  showBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppLocalizations.of(context)!.select_language,
            style: AppStyles.style18BlackW600
                .copyWith(color: AppColors.blackColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(10), // Space between elements

          // Language options (Example of language selection)
          GestureDetector(
            onTap: () {
              // Handle tap on Arabic option
              log('Arabic selected');
              Navigator.pop(context); // Close bottom sheet after selection
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: AutoSizeText(
                AppLocalizations.of(context)!.ar_key,
                style: AppStyles.style18BlackW500
                    .copyWith(color: AppColors.blueColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close bottom sheet after selection
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: AutoSizeText(
                AppLocalizations.of(context)!.en_k,
                style: AppStyles.style18BlackW500
                    .copyWith(color: AppColors.blueColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
