import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
      color: AppColors.primaryColor,
      size: 50.r,
    ));
  }
}
