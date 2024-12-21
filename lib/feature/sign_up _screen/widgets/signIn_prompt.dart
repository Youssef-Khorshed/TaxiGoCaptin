import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/Utils/routes/routes.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: const TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: 'Sign in',
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
