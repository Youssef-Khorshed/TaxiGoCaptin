import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(FontAwesomeIcons.checkCircle, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'By signing up, you agree to the ',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: 'Terms of service',
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
                  const TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'Privacy policy.',
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
