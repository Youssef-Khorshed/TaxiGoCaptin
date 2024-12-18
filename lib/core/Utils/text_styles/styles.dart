import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class AppStyles {
  static TextStyle textStyle24 = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle16 = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kblue,
  );

  static TextStyle text16Size400WightGrey = GoogleFonts.poppins(
    color: AppColors.kGrey,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle text16Size400darkGrey = GoogleFonts.poppins(
    color: AppColors.kDarkGray,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle text24Size500Wight = GoogleFonts.poppins(
    color: AppColors.kBlack,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle text24Size500WightDarkGray = GoogleFonts.poppins(
    color: AppColors.kDarkGray,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text20Size500WightDarkGray = GoogleFonts.poppins(
    color: AppColors.kDarkGray,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle text16Size500WightGreyHintText = GoogleFonts.poppins(
    color: AppColors.kHintTextField,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle text14Size500Wight = GoogleFonts.poppins(
    color: AppColors.kBlack,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text14Size500WightRed = GoogleFonts.poppins(
    color: AppColors.kReadCancel,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle text16Size500WightBlack = GoogleFonts.poppins(
    color: AppColors.kBlack,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle text14Size500White = GoogleFonts.poppins(
    color: AppColors.kHintTextField,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text18Size500Blue = GoogleFonts.poppins(
    color: AppColors.kblue,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
}
