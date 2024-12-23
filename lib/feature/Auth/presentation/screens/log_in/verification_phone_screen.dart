import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';



import '../../../../../Core/Utils/validation.dart';
import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/routes/routes.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../APP/custom_widgets/custom_app_bottom.dart';
import '../../../../APP/custom_widgets/custom_app_form_field.dart';
import '../../../../APP/custom_widgets/custom_loading.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../controller/otp_cubit/otp_cubit.dart';
class VerificationPhoneAndPasswordScreen extends StatefulWidget {
  const VerificationPhoneAndPasswordScreen({super.key});

  @override
  State<VerificationPhoneAndPasswordScreen> createState() =>
      _VerificationPhoneAndPasswordScreenState();
}

class _VerificationPhoneAndPasswordScreenState
    extends State<VerificationPhoneAndPasswordScreen> {
  final TextEditingController verificationPhoneController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 80),
              child: const CustomAuthAppBar()),
          body: Form(
            key: OtpCubit.get(context).formKey,
            autovalidateMode:OtpCubit.get(context).autovalidateMode ,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.phoneVerification,
                    style: AppStyles.style24WhiteW500.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  verticalSpace(15),
                  CustomAppFormField(
                    controller:  OtpCubit.get(context).controller ,
                    validator: (value) {
                    return  Validation.validatePhone(value, context);
                    },

                    isPassword: false,
                    obscureText: false,
                    hintText: AppLocalizations.of(context)!.password_required,
                    isPhone: true,
                  ),
                  const Spacer(),
                  BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if(state is ForgetPassSuccess){
                  Navigator.pushReplacementNamed(context, Routes.otp,arguments: OtpCubit.get(context).controller?.text
                      );

                }
                else if(state is ForgetPassFailure){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error??"Error")));
                }  },
              builder: (context, state) {
                if(state is ForgetPassLoading){
                  return CustomLoading();
                }
                return CustomAppBottom(
                    onPressed: () async {
                      // Navigator.pushNamed(
                      //   context,
                      //   Routes.generalScreen,
                      // );
                  await    OtpCubit.get(context).validateForgetPassword(context);
                  setState(() {

                  });
                    //   Navigator.pushNamed(context, Routes.otp,arguments: OtpCubit.get(context).controller?.text
                    //   );
                    },
                    buttonText: AppLocalizations.of(context)!.send_otp,
                  );
              },
            ),
                ],
              ),
            ),
          )),
    );
  }
}
