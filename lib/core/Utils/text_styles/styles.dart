import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class AppStyles {
  static TextStyle style16WhiteW500 = TextStyle(
    fontSize: 16,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.cairo().fontFamily,
    height: 0,
  );

  static TextStyle style24WhiteW500 = TextStyle(
    fontSize: 24,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.cairo().fontFamily,
    height: 0,
  );

  static TextStyle text24Size500Wight = GoogleFonts.poppins(
    color: AppColors.kBlack,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle20 = GoogleFonts.poppins(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.kWhite);

  static TextStyle textStyle20Blue = GoogleFonts.poppins(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.kblue);
  static TextStyle textStyle18 = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle14 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle24Bron = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w500, color: AppColors.kBrown);
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

  static TextStyle text24Size500WightDarkGray = GoogleFonts.poppins(
    color: AppColors.kDarkGray,
    fontSize: 24.sp,
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

  static TextStyle text14Size500kOrange = GoogleFonts.poppins(
    color: AppColors.kBlack,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle text16Size500WightBlack = GoogleFonts.poppins(
    color: AppColors.kBlack,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle text14Size500WightW = GoogleFonts.poppins(
    color: AppColors.kHintTextField,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
