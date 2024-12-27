import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../Core/Utils/enums/localization.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/localization/cubit/local_cubit.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            Transform.rotate(
              angle: LocalCubit.get(context).localizationThemeState ==
                      LocalizationThemeState.ar
                  ? 3.14
                  : 0,
              child: Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.black,
                size: 25.r,
              ),
            ),
            horizontalSpace(5.w),
            AutoSizeText(
              AppLocalizations.of(context)!.back,
              style: AppStyles.style16WhiteW500
                  .copyWith(fontSize: 18.sp, color: AppColors.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
