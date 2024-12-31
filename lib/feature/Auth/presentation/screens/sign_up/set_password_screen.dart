import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_app_form_field.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../../core/Utils/validation.dart';
import '../../../../APP/custom_widgets/custom_Button.dart';
import '../../controller/set_password_cubit/set_password_cubit.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode:
                      SetPasswordCubit.get(context).setPasswordAutoValidateMode,
                  key: SetPasswordCubit.get(context).setPasswordFormKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 13.0.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(30.h),
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
                        verticalSpace(20.h),
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.setPassword,
                            style: AppStyles.style24WhiteW500
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        verticalSpace(15.h),
                        Padding(
                          padding: EdgeInsets.all(4.0.w),
                          child: Column(
                            children: [
                              CustomAppFormField(
                                hintStyle: AppStyles.style14BlackW500,
                                isPassword: true,
                                obscureText: true,
                                validator: (value) =>
                                    Validation.validatePassword(value, context),
                                hintText: AppLocalizations.of(context)!
                                    .setYourPassword,
                                controller: SetPasswordCubit.get(context)
                                    .setPasswordController,
                                isNumbers: false,
                              ),
                              verticalSpace(10.h),
                              CustomAppFormField(
                                hintStyle: AppStyles.style14BlackW500,
                                validator: (value) =>
                                    Validation.validatePassword(value, context),
                                isPassword: true,
                                obscureText: true,
                                hintText: AppLocalizations.of(context)!
                                    .confirmPassword,
                                controller: SetPasswordCubit.get(context)
                                    .setPasswordConfirmationController,
                                isNumbers: false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(10.h),
            BlocConsumer<SetPasswordCubit, SetPasswordState>(
              listener: (context, state) {
                if (state is SetPasswordError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                } else if (state is SetPasswordSuccess) {
                  Navigator.pushReplacementNamed(context, Routes.setProfile);
                }
              },
              builder: (context, state) {
                if (state is SetPasswordLoading) {
                  return const CustomLoading();
                }
                return CustomAppBottom(
                    buttonText: AppLocalizations.of(context)!.register,
                    onPressed: () async {
                      if (SetPasswordCubit.get(context)
                          .setPasswordFormKey
                          .currentState!
                          .validate()) {
                        await SetPasswordCubit.get(context)
                            .setPasswordValidate(context);
                      }
                      // Navigator.pushNamed(context, Routes.setProfile);

                      setState(() {});
                    });
              },
            ),
            verticalSpace(30.h),
          ],
        ),
      ),
    );
  }
}
