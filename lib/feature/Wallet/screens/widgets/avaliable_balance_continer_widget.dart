import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import '../../../../core/Utils/spacing/vertspace.dart';

class AvaliableBalanceContinerWidget extends StatelessWidget {
  final String amount;
  const AvaliableBalanceContinerWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoSizeText(
              AppLocalizations.of(context)!.available_balance,
              style: AppStyles.style16BlackW600,
            ),
            Row(
              children: [
                AutoSizeText(
                  amount,
                  style: AppStyles.style18BlueBold,
                ),
                horizontalSpace(5),
                AutoSizeText(
                  AppLocalizations.of(context)!.currency_iqd,
                  style: AppStyles.style12DarkgrayW400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
