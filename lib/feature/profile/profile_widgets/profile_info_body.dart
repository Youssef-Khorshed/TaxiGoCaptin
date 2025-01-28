import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/enums/localization.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/profile/data/profile_model.dart';
import 'package:taxi_go_driver/feature/profile/profile_widgets/custom_chage_language_profile.dart';
import 'package:taxi_go_driver/feature/profile/profile_widgets/profile_image_widget.dart';
import 'package:taxi_go_driver/feature/profile/profile_widgets/profile_info_item.dart';

class ProfileInfoBody extends StatelessWidget {
  const ProfileInfoBody({super.key, required this.userInfo});
  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    LocalizationThemeState.en;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: [
          verticalSpace(40.h),
          ProfileImageWidget(
            imagePath: userInfo.picture,
          ),
          verticalSpace(10.h),
          Column(
            children: [
              AutoSizeText(
                userInfo.name ?? 'name',
                style: AppStyles.style20BlackW500
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.amberColor,
                    size: 20,
                  ),
                  AutoSizeText(
                    userInfo.rate ?? '2.5',
                    style: AppStyles.style16DarkgrayW500.copyWith(
                        color: AppColors.darkgrayColor.withAlpha(180)),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.phone_nubmer,
            textInfo: userInfo.phone!.startsWith('+')
                ? '${userInfo.phone!.substring(1)}+'
                : userInfo.phone!,
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.address,
            textInfo: userInfo.address ?? '1 January 1999',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.balance,
            textInfo:
                '${userInfo.balance} ${AppLocalizations.of(context)!.iqd}',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.gender,
            textInfo: userInfo.gender ?? 'male',
          ),
          verticalSpace(15.h),
          ProfileInfoItem(
            lable: AppLocalizations.of(context)!.lang,
            textInfo: AppLocalizations.of(context)!.arabic,
            toggle: const CustomChagelanguageProfile(),
          ),
        ]),
      ),
    );
  }
}
