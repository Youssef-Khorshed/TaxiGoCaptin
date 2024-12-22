import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import '../../../../Core/Utils/Colors/app_colors.dart';
import '../../../../Core/Utils/Spacing/app_spacing.dart';

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
                  style: AppTextStyles.sharelocation,
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
