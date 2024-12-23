import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomResendCode extends StatelessWidget {
  const CustomResendCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppLocalizations.of(context)!.did_not_receive_code,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.resend_again,
            style:  TextStyle(
              color:AppColors.kPrimaryColor,
              fontSize: 14.r,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              },
          ),
        ],
      ),
    );
  }
}


