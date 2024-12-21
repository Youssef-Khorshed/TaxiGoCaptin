import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/presentaion/widgets/appBar_widget.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/presentaion/widgets/otp_view_body.dart';

import '../../../core/Utils/colors/colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    this.verificationId,
  });

  final String? verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: CustomAppBar(),
      body: OtpViewBody(),
    );
  }
}
