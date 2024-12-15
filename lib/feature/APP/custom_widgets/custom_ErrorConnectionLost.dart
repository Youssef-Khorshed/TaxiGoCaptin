// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';

// ignore: must_be_immutable
class CustomErrorconnectionlost extends StatelessWidget {
  CustomErrorconnectionlost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Lottie.asset(AppLottie.internetFailure,
                fit: BoxFit.cover, height: 300.h, width: 300.w),
            verticalSpace(10.h),
            Text('Please Check Your Internet Connection'),
          ],
        ),
      ),
    ));
  }
}
