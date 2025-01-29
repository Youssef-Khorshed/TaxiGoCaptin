import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/Custom_button.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';

import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../../core/Utils/text_styles/styles.dart';
import '../../../../../core/Utils/validation.dart';
import '../../../../APP/custom_widgets/custom_app_form_field.dart';
import '../../controller/login_cubit/login_cubit.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Form(
                autovalidateMode: LoginCubit.get(context).loginAutoValidateMode,
                key: LoginCubit.get(context).loginFormKey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(15.h),
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
                      verticalSpace(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: AutoSizeText(
                          AppLocalizations.of(context)!.logIn,
                          style: AppStyles.style24WhiteW500
                              .copyWith(color: AppColors.blackColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      verticalSpace(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                        child: Column(children: [
                          CustomAppFormField(
                            hintStyle: AppStyles.style14BlackW500,
                            onTap: () {},
                            isPassword: false,
                            obscureText: false,
                            hintText: AppLocalizations.of(context)!.phoneNumber,
                            controller:
                                LoginCubit.get(context).loginPhoneController,
                            validator: (p0) =>
                                Validation.validatePhone(p0, context),
                            isPhone: true,
                            isNumbers: true,
                          ),
                          verticalSpace(15.h),
                          CustomAppFormField(
                            hintStyle: AppStyles.style14BlackW500,
                            onTap: () {},
                            isPassword: true,
                            obscureText: true,
                            hintText:
                                AppLocalizations.of(context)!.password_required,
                            controller:
                                LoginCubit.get(context).loginPassController,
                            validator: (p0) =>
                                Validation.validatePassword(p0, context),
                            isNumbers: false,
                          ),
                        ]),
                      ),

                      verticalSpace(10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.verificationPhoneAndPassword);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgotPassword,
                            style: AppStyles.style16WhiteW500.copyWith(
                                color: AppColors.redColor, fontSize: 14.sp),
                          ),
                        ),
                      ),
                      verticalSpace(MediaQuery.of(context).size.width / 1.7)
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginInSuccess) {
                    LoginCubit.get(context).loginAutoValidateMode =
                        AutovalidateMode.disabled;
                    LoginCubit.get(context).loginPhoneController.clear();
                    LoginCubit.get(context).loginPassController.clear();
                    Navigator.pushReplacementNamed(context, Routes.otp);
                  } else if (state is LoginInError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is LoginInLoading) {
                    return const CustomLoading();
                  }
                  return CustomAppBottom(
                    onPressed: () async {
                      await LoginCubit.get(context).loginValidate(context);
                      setState(() {});
                    },
                    buttonText: AppLocalizations.of(context)!.logIn,
                  );
                },
              ),
              verticalSpace(10.h),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.signUp);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.dontHaveAccount,
                      style: AppStyles.style16WhiteW500.copyWith(
                        color: AppColors.blackColor,
                      ),
                      children: [
                        WidgetSpan(
                          child: SizedBox(width: 5.w),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.signUp,
                          style: AppStyles.style16WhiteW500.copyWith(
                            color: AppColors.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(25.h),
            ],
          )),
    );
  }
}
