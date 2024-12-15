import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/widgets/phone_number_field.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/widgets/signIn_prompt.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/widgets/sign_up_boutton.dart';

import 'TermsAndPrivacyText.dart';
import 'custom_gender_field.dart';
import 'custom_text_field.dart';
import 'or_divider.dart';
import 'social_icons.dart';

class SignUpHomeBody extends StatelessWidget {
  const SignUpHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sign up',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextField(
            label: 'Name',
          ),
          const CustomTextField(
            label: 'Email',
          ),
          const PhoneNumberFailed(),
          CustomGenderField(
            genderOptions: const ["male", "female"],
            label: 'Gander',
            onChanged: (String? value) {},
          ),
          TermsAndPrivacyText(),
          const SizedBox(
            height: 15,
          ),
          const SignUpButton(),
          const SizedBox(
            height: 15,
          ),
          OrDivider(),
          const SizedBox(
            height: 15,
          ),
          SocialIcons(),
          const SizedBox(
            height: 15,
          ),
          const SignInPrompt()
        ],
      ),
    );
  }
}
