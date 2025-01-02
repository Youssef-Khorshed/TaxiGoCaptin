import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

AppBar documentCustomAppBar(BuildContext context, documentsCounts) {
  return AppBar(
    leading: SizedBox(),
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      AppLocalizations.of(context)!.my_document,
      style: AppStyles.text20Size500WightDarkGray,
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 23.r,
            backgroundColor: AppColors.kDarkBlue,
            child: Text(
              "${documentsCounts}/10",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ),
        ],
      ),
      horizontalSpace(45.w),
    ],
  );
}
