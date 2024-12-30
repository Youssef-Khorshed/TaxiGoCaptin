import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../APP/custom_widgets/custom_Button.dart';
import '../../controller/otp_cubit/otp_cubit.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, this.phone});
  final String? phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? code;

  late Timer _timer;

  int _seconds = 60;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    OtpCubit.get(context).controller?.dispose();

    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.phone}");
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              verticalSpace(30),
              Center(
                child: AutoSizeText(
                  widget.phone != null && widget.phone!.isNotEmpty
                      ? AppLocalizations.of(context)!.forgotPassword
                      : AppLocalizations.of(context)!.phoneVerification,
                  style:
                      AppStyles.style24WhiteW500.copyWith(color: Colors.black),
                ),
              ),
              Center(
                child: Text(AppLocalizations.of(context)!.enterOTPCode,
                    style: AppStyles.style16WhiteW500
                        .copyWith(color: AppColors.grayColor)),
              ),
              verticalSpace(15.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  length: 5,
                  onChanged: (value) {
                    code = value;
                    print(value);
                  },
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50.h,
                    fieldWidth: 53.w,
                    activeFillColor: AppColors.whiteColor,
                    selectedFillColor: AppColors.whiteColor,
                    inactiveFillColor: AppColors.whiteColor,
                    activeColor: AppColors.blueColor,
                    selectedColor: AppColors.blueColor,
                    inactiveColor: AppColors.grayColor,
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              verticalSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.did_not_receive_code,
                    style: AppStyles.style16WhiteW500
                        .copyWith(color: AppColors.grayColor),
                  ),
                  horizontalSpace(5.w),
                  _seconds > 0
                      ? Center(
                          child: Text(
                            ' $_seconds ${AppLocalizations.of(context)!.seconds}',
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _startTimer();

                            if (widget.phone == "" || widget.phone == null) {
                              OtpCubit.get(context)
                                  .sendOtpEmailVerification(context);
                            } else {
                              OtpCubit.get(context)
                                  .forgetPassword(context, widget.phone!);
                            }
                          },
                          child: AutoSizeText(
                              AppLocalizations.of(context)!.resend_again,
                              style: AppStyles.style16WhiteW500
                                  .copyWith(color: AppColors.blueColor)),
                        ),
                ],
              ),
              const Spacer(),
              BlocConsumer<OtpCubit, OtpState>(
                listener: (context, state) {
                  if (state is VerifyAccountSuccess) {
                    if (widget.phone == "" || widget.phone == null) {
                      Navigator.pushReplacementNamed(
                          context, Routes.setPassword);
                    } else {
                      Navigator.pushReplacementNamed(
                          context, Routes.setNewPassword,
                          arguments: widget.phone);
                    }
                  } else if (state is VerifyAccountFailure) {
                    Fluttertoast.showToast(
                        msg: state.error ??
                            AppLocalizations.of(context)!.tryAgain);
                  }
                },
                builder: (context, state) {
                  if (state is VerifyAccountLoading) {
                    return const CustomLoading();
                  }
                  return CustomAppBottom(
                    textColor: AppColors.whiteColor,
                    buttonText: AppLocalizations.of(context)!.verify,
                    onPressed: () async {
                      Navigator.pushReplacementNamed(
                          context, Routes.setNewPassword,
                          arguments: widget.phone);
                      // Navigator.pushNamed(context, AppRoutes.setPassword,arguments: widget.phone);
                      _seconds = 0;
                      setState(() {});
                      if (widget.phone == "" || widget.phone == null) {
                        await OtpCubit.get(context)
                            .verifyAccount(context, int.parse(code ?? "0"));
                      } else {
                        await OtpCubit.get(context).forgotPasswordCheckCode(
                            context,
                            code: int.parse(code ?? "0"),
                            phone: widget.phone ?? "");
                      }
                      setState(() {});
                    },
                  );
                },
              ),
              verticalSpace(15)
            ],
          ),
        ),
      ),
    );
  }
}
