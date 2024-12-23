import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/controller/sign_in_cubit.dart';

import '../../../APP/custom_widgets/custom_Button.dart';
import '../../../APP/custom_widgets/custom_PasswordField.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../../../../core/Utils/text_styles/styles.dart';
import '../../../APP/custom_widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SetPasswordBody extends StatefulWidget {
  SetPasswordBody({super.key});

  @override
  State<SetPasswordBody> createState() => _SetPasswordBodyState();
}

class _SetPasswordBodyState extends State<SetPasswordBody> {
  @override
  void dispose() {
SignInCubit.get(context).setPasswordFormKey.currentState?.dispose();
SignInCubit.get(context).setPasswordController.dispose();
SignInCubit.get(context).setPasswordConfirmationController.dispose();
SignInCubit.get(context).setPasswordAutoValidateMode = AutovalidateMode.disabled;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: SignInCubit.get(context).setPasswordAutoValidateMode,
      key: SignInCubit.get(context).setPasswordFormKey,
      child: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding:  EdgeInsets.all(8.0.r),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:  Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.kBrown,
                  ),
                ),
                CustomText(
                  text: AppLocalizations.of(context)!.back,
                  style: AppStyles.textStyle16.copyWith(
                    color: AppColors.kDarkGray2
                  ),
                )
              ],
            ),
          ),
        30.verticalSpace,
          Text(
           AppLocalizations.of(context)!.setPassword,
            style:AppStyles.textStyle24,
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomText(
            text:    AppLocalizations.of(context)!.setYourPassword,
            style: AppStyles.textStyle16,
          ),
         25.verticalSpace,
          Padding(
            padding: EdgeInsets.all(15.w),
            child: PasswordField(

              hintText:    AppLocalizations.of(context)!.enterYourPassword,
              controllers: SignInCubit.get(context).setPasswordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: PasswordField(

              hintText:    AppLocalizations.of(context)!.confirmPassword,
              controllers:
                  SignInCubit.get(context).setPasswordConfirmationController ,
            ),
          ),
          CustomText(
            text:    AppLocalizations.of(context)!.passwordRequirement,
            style: AppStyles.textStyle16,
          ),
         40.verticalSpace,
          Padding(
            padding: EdgeInsets.all(10.w),
            child: BlocConsumer<SignInCubit, SignInState>(
  listener: (context, state) {
    if (state is SetPasswordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
        ),
      );
    }
    else if (state is SetPasswordSuccess) {

      Navigator.pushNamed(context, Routes.signInRoute);
    }
  },
  builder: (context, state) {
    if (state is SetPasswordLoading) {
      return CustomLoading();
    }


    return CustomButton(
              onPressed: () {


                SignInCubit.get(context).setPasswordValidate(context);
                // Navigator.pushNamed(
                //   context,
                //   Routes.profileRoute,
                // );
                // if (formKey.currentState!.validate()) {
                //
                // }
              },
              text:AppLocalizations.of(context)!.register,
            );
  },
),
          )
        ],
      ),
    );
  }
}
