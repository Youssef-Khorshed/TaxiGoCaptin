import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../core/Utils/colors/colors.dart';
class CustomTermsCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChanged;
  const CustomTermsCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIconButton(),
        _buildTermsText(),
      ],
    );
  }

  Widget _buildIconButton() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        isChecked ? FontAwesomeIcons.circleCheck : FontAwesomeIcons.circle,
        color: isChecked ? AppColors.blueColor : AppColors.grayColor,
        size: 24.r,
      ),
      onPressed: () => onChanged(!isChecked),
    );
  }

  Widget _buildTermsText() {
    return Expanded(
      child: Builder(
        builder: (context) {
          return Text.rich(
            TextSpan(
              text: AppLocalizations.of(context)!.agreement,
              style: AppStyles.style16WhiteW500
                  .copyWith(color: AppColors.grayColor, fontSize: 14.sp),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.terms_of_service,
                  style: AppStyles.style16WhiteW500
                      .copyWith(color: AppColors.blueColor, fontSize: 14.sp),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.and,
                  style: AppStyles.style16WhiteW500
                      .copyWith(color: AppColors.grayColor, fontSize: 14.sp),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.privacy_policy,
                  style: AppStyles.style16WhiteW500
                      .copyWith(color: AppColors.blueColor, fontSize: 14.sp),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
