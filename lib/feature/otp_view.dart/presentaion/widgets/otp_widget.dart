import 'package:flutter/material.dart';
import '../../../../core/Utils/colors/colors.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import '../../../../settings/Localization/model/otp_model.dart';
import 'appBar_widget.dart';
import 'custom_button.dart';

class ForgotPassword extends StatelessWidget {
  final String emailOrPhone;

  const ForgotPassword({super.key, required this.emailOrPhone});

  @override
  Widget build(BuildContext context) {
    final OTPModel otpModel = OTPModel(emailOrPhone: emailOrPhone);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mediaQuery.height / 10,
            ),
            Text('Forgot Password',
                // textAlign: TextAlign.center,
                style: AppStyles.text24Size500WightDarkGray),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Code has been sent to ${otpModel.maskedEmailOrPhone()}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: mediaQuery.height / 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive code? ",
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Resend again',
                    style: TextStyle(color: AppColors.kblue, fontSize: 20),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const SizedBox(
              width: double.infinity,
              child: CustomButton(text: "Verify"),
              // child: ElevatedButton(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.blue,
              //     padding: const EdgeInsets.symmetric(vertical: 16),
              //   ),
              //   child: const Text('Verify'),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
