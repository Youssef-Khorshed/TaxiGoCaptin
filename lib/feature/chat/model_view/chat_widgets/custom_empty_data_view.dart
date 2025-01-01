import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

class CustomEmptyDataView extends StatelessWidget {
  const CustomEmptyDataView({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.emptyData,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          verticalSpace(30.h),
          AutoSizeText(
            message,
            style: AppStyles.style20BlackW500,
          )
        ],
      ),
    );
  }
}
