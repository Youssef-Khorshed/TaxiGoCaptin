import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key,this.onTap});
final void Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60.0.h,
      child: ElevatedButton(
        onPressed:onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D1AD8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child:  Text(
         AppLocalizations.of(context)!.sign_up,
          style: TextStyle(
            color: Colors.white, // لون النص
            fontSize: 16.r, // حجم النص
          ),
        ),
      ),
    );
  }
}
