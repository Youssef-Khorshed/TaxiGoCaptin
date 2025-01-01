import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class ShareLocation extends StatelessWidget {
  const ShareLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          width: 158.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(20.r),
          ),
          alignment: Alignment.center,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)!.sharelocation,
                  style: AppStyles.sharelocation,
                ),
                horizontalSpace(10.w),
                Image.asset(AppIcons.shareLocation),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
