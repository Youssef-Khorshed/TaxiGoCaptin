import 'package:flutter/material.dart';
import '../../core/Utils/colors/colors.dart';
import '../otp_view.dart/presentaion/widgets/appBar_widget.dart';
import '../otp_view.dart/presentaion/widgets/verification_view_body.dart';

class VerificationScreen extends StatelessWidget {
  final TextEditingController emailOrPhoneController = TextEditingController();

  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: const CustomAppBar(),
      body:
          ConfirmMobileOrEmail(emailOrPhoneController: emailOrPhoneController),
    );
  }
}
