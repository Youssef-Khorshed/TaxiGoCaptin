import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_Button.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/routes/routes.dart';
import 'widgets/otp_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String getOTPValue() {
    String otp = "";
    for (TextEditingController controller in controllers) {
      otp += controller.text;
    }
    return otp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          title: Text('Back',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    // color: kLightTextColor,
                  )),
        ),
        body: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(
                      1,
                    ),
                  ),
                  Text(
                    'Phone Verification',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 22,
                          letterSpacing: 0.001,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  verticalSpace(2.5),
                  Text(
                    'Enter your OTP code',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  verticalSpace(5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: controllers
                                .map((controller) => OTPField(
                                      hint: controllers.indexOf(controller) + 1,
                                      controller: controller,
                                      autoFocus: true,
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(6),
              verticalSpace(1),
              RichText(
                text: TextSpan(
                  text: 'Didn\'t receive the code? ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                  children: [
                    TextSpan(
                      text: ' Resend again',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomAppBottom(
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.setPassowrdRoute);
                },
                buttonText: '',
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
