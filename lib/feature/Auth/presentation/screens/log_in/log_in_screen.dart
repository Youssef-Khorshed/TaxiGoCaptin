import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../Core/Utils/validation.dart';
import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/routes/routes.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../../core/Utils/text_styles/styles.dart';
import '../../../../APP/custom_widgets/custom_app_bottom.dart';
import '../../../../APP/custom_widgets/custom_app_form_field.dart';
import '../../../../APP/custom_widgets/custom_loading.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
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
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 80),
              child: const CustomAuthAppBar()),
          body: Column(
            children: [
              Form(
                autovalidateMode: LoginCubit.get(context).loginAutoValidateMode,
                key: LoginCubit.get(context).loginFormKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(15),
                          Text(
                            AppLocalizations.of(context)!.logIn,
                            style: AppStyles.style24WhiteW500
                                .copyWith(color: AppColors.blackColor),
                            textAlign: TextAlign.left,
                          ),
                          verticalSpace(15),
                          CustomAppFormField(
                            isPassword: false,
                            obscureText: false,
                            hintText: AppLocalizations.of(context)!.phoneNumber,
                            controller:
                                LoginCubit.get(context).loginPhoneController,
                            validator: (p0) =>
                                Validation.validatePhone(p0, context),
                            isPhone: true,
                          ),
                          verticalSpace(10),
                          CustomAppFormField(
                            isPassword: true,
                            obscureText: true,
                            hintText:
                                AppLocalizations.of(context)!.password_required,
                            controller:
                                LoginCubit.get(context).loginPassController,
                            validator: (p0) =>
                                Validation.validatePassword(p0, context),
                          ),
                          10.verticalSpace,

                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context,
                                  Routes.verificationPhoneAndPassword);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.forgotPassword,
                              style: AppStyles.style16WhiteW500.copyWith(
                                  color: AppColors.redColor, fontSize: 12.sp),
                            ),
                          ),
                          // const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginInSuccess) {
                    LoginCubit.get(context).loginAutoValidateMode =
                        AutovalidateMode.disabled;
                    LoginCubit.get(context).loginPhoneController.clear();
                    LoginCubit.get(context).loginPassController.clear();
                    Navigator.pushReplacementNamed(
                        context, Routes.homeRoute);
                  } else if (state is LoginInError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is LoginInLoading) {
                    return CustomLoading();
                  }
                  return CustomAppBottom(
                    onPressed: () async {
                      await LoginCubit.get(context).loginValidate(context);
                      setState(() {

                      });
                    },
                    buttonText: AppLocalizations.of(context)!.logIn,
                  );
                },
              ),
              verticalSpace(10),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.signUp);
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.dontHaveAccount,
                      style: AppStyles.style16WhiteW500
                          .copyWith(color: AppColors.blackColor),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.signUp,
                          style: AppStyles.style16WhiteW500
                              .copyWith(color: AppColors.blueColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpace(50),
            ],
          )),
    );
  }
}
