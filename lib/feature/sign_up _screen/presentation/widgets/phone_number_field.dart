import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/Utils/colors/colors.dart';


class PhoneNumberFailed extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String countryCode;
  final String countryFlag;

   PhoneNumberFailed({
    super.key,
    this.controller,
    this.onChanged,
    this.countryCode = '+964',
    this.countryFlag = Assets.iconsIraq, this.validator,
  });
  String? Function(dynamic p0)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(bottom: 30.h),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.5), width: 1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.r),
              child: Row(
                children: [
                  Image.asset(
                    countryFlag,
                    width: 30.w,
                    height: 50.h,
                    fit: BoxFit.cover,
                  ),
                   SizedBox(width: 8.w),
                  Text(
                    countryCode,
                    style:  TextStyle(
                      fontSize: 16.r,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TextFormField(
validator: validator,
                controller: controller,
                onChanged: onChanged,
                decoration:  InputDecoration(
                  hintText: AppLocalizations.of(context)!.your_mobile_number,
                  hintStyle: TextStyle(
                    fontSize: 16.r,
                    color: AppColors.kgrey,
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.w,
                    horizontal: 10.h,
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                      10), // Adjust max length as needed
                ],
                style:  TextStyle(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
