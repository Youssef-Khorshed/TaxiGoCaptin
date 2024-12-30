import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/text_styles/styles.dart';

class NotificationItemWidget extends StatelessWidget {
  final int index;
  const NotificationItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
      child: Card(
        elevation: 2.5,
        shadowColor: AppColors.blackColor,
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: double.infinity,
          height: 80.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                AppLocalizations.of(context)!.system_notification +
                    " " +
                    index.toString(),
                style: AppStyles.style16BlackW600,
              ),
              AutoSizeText(
                AppLocalizations.of(context)!.notification_details,
                style: AppStyles.style14BlackW500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
