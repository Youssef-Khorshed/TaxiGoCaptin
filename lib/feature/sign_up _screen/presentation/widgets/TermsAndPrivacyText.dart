import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 8.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(FontAwesomeIcons.checkCircle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text:AppLocalizations.of(context)!.by_signing_up ,
                style:  TextStyle(
                  color: Colors.grey,
                  fontSize: 14.r,
                ),
                children: [
                  TextSpan(
                    text:AppLocalizations.of(context)!.terms_of_service,
                    style: const TextStyle(
                      color: Color(0xFFFEC400),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Terms of Service tapped');
                      },
                  ),
                   TextSpan(
                    text: AppLocalizations.of(context)!.and,
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!.privacy_policy,
                    style: const TextStyle(
                      color: Color(0xFFFEC400),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Privacy Policy tapped');
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
