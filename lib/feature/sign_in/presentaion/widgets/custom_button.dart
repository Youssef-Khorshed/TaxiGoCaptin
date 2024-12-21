import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomButton({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60.0, // نفس ارتفاع الحقول الأخرى
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D1AD8), // لون الزر
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // نفس شكل الحقول الأخرى
          ),
        ),
        child: const Text(
          'Verify',
          style: TextStyle(
            color: Colors.white, // لون النص
            fontSize: 16, // حجم النص
          ),
        ),
      ),
    );
  }
}
