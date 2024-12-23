import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/core/Utils/validation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/presentation/controller/sign_up_cubit.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../controller/sign_in_cubit.dart';
import '../forgot_password_page.dart';
import 'CustomTextField_1.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController Passwordcontroller = TextEditingController();

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: SignInCubit.get(context).loginFormKey,
              autovalidateMode: SignInCubit.get(context).loginAutoValidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.sign_in,
                      style:AppStyles.textStyle24Bron
                    ),
                    50.verticalSpace,
                    CustomTextField2(
                      validator: (p0) => Validation.validatePhone(p0,context),
              controller: SignInCubit.get(context).loginPhoneController,
                      label: AppLocalizations.of(context)!.phoneNumber,
                      onChanged: (value) {},
                    ),
                   20.verticalSpace,
                    CustomTextField2(
            
                      validator: (p0) => Validation.validatePassword(p0,context),
            
                      controller: SignInCubit.get(context).loginPassController,
                      label: AppLocalizations.of(context)!.enterYourPassword,
                      isPassword: true,
                      onChanged: (value) {
                        Passwordcontroller.text = value;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.confirmMobileOrEmail);
            
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => // OtpScreen()
                          //           ForgotPassword(emailOrPhone: "hoouda19@gmail.com"),
                          //     ));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                          style: AppStyles.text14Size500kOrange
                        ),
                      ),
                    ),
            
                  ],
            
                ),
              ),
            ),
          ),
        
          SizedBox(
            width: double.infinity,
            height: 54.h,
            child: BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInError) {

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage),duration: Duration(seconds: 2),));

                }
              },
              builder: (context, state) {
                if (state is SignInLoading) {
                  return CustomLoading();
                }
                return ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, Routes.homeRoute);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const ForgotPasswordPage(),
                      //     ));
                      SignInCubit.get(context).loginValidate(context);

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kDarkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                        AppLocalizations.of(context)!.sign_in,
                        style: AppStyles.textStyle14
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
