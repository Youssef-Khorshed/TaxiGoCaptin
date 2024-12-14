import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/Utils/colors/colors.dart';

class CustomResendCode extends StatelessWidget {
  const CustomResendCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Didn’t receive code? ",
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        children: [
          TextSpan(
            text: "Resend again",
            style: const TextStyle(
              color:AppColors.kPrimaryColor,
              fontSize: 14,
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


