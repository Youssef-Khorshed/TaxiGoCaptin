import 'package:flutter/material.dart';

import '../../../core/Utils/routes/routes.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60.0, // نفس ارتفاع الحقول الأخرى
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.otpScreen);
          // قم بإضافة الكود الذي تريد تنفيذه عند الضغط على الزر
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D1AD8), // لون الزر
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // نفس شكل الحقول الأخرى
          ),
        ),
        child: const Text(
          'Sign up',
          style: TextStyle(
            color: Colors.white, // لون النص
            fontSize: 16, // حجم النص
          ),
        ),
      ),
    );
  }
}
