import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/Utils/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text:  AppLocalizations.of(context)!.already_have_an_account,
          style: const TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: AppLocalizations.of(context)!.sign_in,
              style: const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, Routes.signInRoute);

                },
            ),
          ],
        ),
      ),
    );
  }
}
