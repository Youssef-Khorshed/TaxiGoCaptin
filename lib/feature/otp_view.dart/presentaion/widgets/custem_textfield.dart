import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/text_styles/styles.dart';

class VerifyTextField extends StatelessWidget {
   const VerifyTextField({
    super.key,
    required this.emailOrPhoneController,
  });

  final TextEditingController emailOrPhoneController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextField(
        controller: emailOrPhoneController,
        decoration: InputDecoration(
          hintStyle: AppStyles.text16Size500WightGreyHintText, 
          contentPadding: const EdgeInsets.all(20),
          hintText: 'Email or phone number',
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppStyles.text16Size500WightGreyHintText.color!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppStyles.text16Size500WightGreyHintText.color!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: AppStyles.text16Size500WightGreyHintText.color!,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}