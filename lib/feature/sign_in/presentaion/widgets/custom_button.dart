import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomButton({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60.0.h, // نفس ارتفاع الحقول الأخرى
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D1AD8), // لون الزر
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r), // نفس شكل الحقول الأخرى
          ),
        ),
        child:  Text(
          AppLocalizations.of(context)!.verify,
          style: TextStyle(
            color: AppColors.kWhite, // لون النص
            fontSize: 16.r, // حجم النص
          ),
        ),
      ),
    );
  }
}