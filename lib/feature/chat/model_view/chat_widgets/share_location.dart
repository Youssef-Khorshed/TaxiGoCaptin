import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/Utils/assets/icons.dart';
import '../../../../core/Utils/spacing/vertspace.dart';
import '../../../../core/Utils/text_styles/styles.dart';

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
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
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
