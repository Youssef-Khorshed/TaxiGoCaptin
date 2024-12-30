import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../Core/Utils/assets/icons.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.your_mobile_number,
        labelStyle: AppStyles.style16WhiteW500
            .copyWith(fontSize: 14.r, color: AppColors.grayColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blackColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueColor, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        errorMaxLines: 1,
        errorStyle: AppStyles.style16WhiteW500
            .copyWith(fontSize: 14.sp, color: AppColors.redColor),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.0.w, left: 12.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24.w,
                height: 16.h,
                child: SvgPicture.asset(
                  AppIcons.iconsIraq,

                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8.w),
              AutoSizeText('+964',
                  style: AppStyles.style16WhiteW500
                      .copyWith(color: AppColors.blackColor)),
            ],
          ),
        ),
      ),
    );
  }
}
