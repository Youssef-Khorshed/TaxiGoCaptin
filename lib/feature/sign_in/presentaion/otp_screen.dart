import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/otp_view.dart/presentaion/controller/otp_cubit/otp_cubit.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/widgets/otp_field.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';

import '../../APP/custom_widgets/custom_Button.dart';

import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/routes/routes.dart';
import '../../APP/custom_widgets/custom_loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key,  this.phone});
final  String? phone;
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
  void controllerListing() {}
  String getOTPValue() {
    String otp = "";
    for (TextEditingController controller in controllers) {
      otp += controller.text;
    }
    return otp;
  }

  late Timer _timer;

  int _seconds = 60;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  void _startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          title: Text(AppLocalizations.of(context)!.back,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18.sp,
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
                    AppLocalizations.of(context)!.phoneVerification,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 22.r,
                          letterSpacing: 0.001,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  verticalSpace(2.5),
                  Text(
                    AppLocalizations.of(context)!.enterOTPCode,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  verticalSpace(5),
                  Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(40.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: controllers
                                .map((controller) => OTPField(
                                      onEditingComplete: () {
                                        print('Completed');

                                        FocusScope.of(context).nextFocus();
                                      },
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
              _seconds > 0
                  ? Center(
                child: Text(
                  ' $_seconds seconds',
                ),
              )
                  :     GestureDetector(
                onTap: () {
                  _startTimer();

                  if(widget.phone==""|| widget.phone==null){
                    OtpCubit.get(context).sendOtpEmailVerification(context);

                  }
                  else
                  OtpCubit.get(context).forgetPassword(context, widget.phone!);
                },
                child: RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.did_not_receive_code,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                    children: [
                      TextSpan(
                        text:AppLocalizations.of(context)!.resend_again,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              BlocConsumer<OtpCubit, OtpState>(
  listener: (context, state) {
    if (state is VerifyAccountSuccess) {
      Navigator.pushNamed(context, Routes.setPassowrdRoute);
    }
    else if (state is VerifyAccountFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error??AppLocalizations.of(context)!.tryAgain,),
        ),
      );
    }
  },
  builder: (context, state) {
    if (state is VerifyAccountLoading) {
      return const CustomLoading();
    }
    return CustomButton(
                onPressed: () async {
                  if (getOTPValue().length == 5) {

                    if(widget.phone==""|| widget.phone==null){
                      await OtpCubit.get(context)
                          .verifyAccount(context, int.parse(getOTPValue()));

                    }
                    else{
                      await OtpCubit.get(context).forgotPasswordCheckCode(context,code: int.parse(getOTPValue()),phone: widget.phone??"");
                    }

                    //
                  }
                },
                text: AppLocalizations.of(context)!.verify,
              );
  },
),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
