import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../../Core/Utils/validation.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../APP/custom_widgets/custom_app_bottom.dart';
import '../../../../APP/custom_widgets/custom_app_form_field.dart';
import '../../../../APP/custom_widgets/custom_loading.dart';
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
                  autovalidateMode: SetPasswordCubit.get(context).setPasswordAutoValidateMode,
                  key: SetPasswordCubit.get(context).setPasswordFormKey,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(children: [
                             Icon(
                              FontAwesomeIcons.angleLeft,
                              color: Colors.black,
                              size: 25.r,
                            ),
                            horizontalSpace(5),
                            Text(AppLocalizations.of(context)!.back, style: AppStyles.textStyle20)
                          ]),
                        ),
                        verticalSpace(20),
                        Text(
                          AppLocalizations.of(context)!.setPassword,
                          style: AppStyles.style24WhiteW500
                              .copyWith(color: Colors.black),
                        ),
                        verticalSpace(15),
                        CustomAppFormField(
                          isPassword: true,
                          obscureText: true,
                          validator: (value) => Validation.validatePassword(value, context),
                          hintText: AppLocalizations.of(context)!.setYourPassword,
                          controller: SetPasswordCubit.get(context).setPasswordController,
                        ),
                        verticalSpace(10),
                        CustomAppFormField(
                          validator: (value) => Validation.validatePassword(value, context),

                          isPassword: true,
                          obscureText: true,
                          hintText:  AppLocalizations.of(context)!.confirmPassword,
                          controller: SetPasswordCubit.get(context).setPasswordConfirmationController ,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpace(10),
            BlocConsumer<SetPasswordCubit, SetPasswordState>(
  listener: (context, state) {
    if (state is SetPasswordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
        ),
      );
    }
    else if (state is SetPasswordSuccess) {

      Navigator.pushReplacementNamed(context, Routes.setProfile);
    }

  },
  builder: (context, state) {
    if (state is SetPasswordLoading) {
      return CustomLoading();
    }
    return CustomAppBottom(
                buttonText: AppLocalizations.of(context)!.register,
                onPressed: () async {
                  // Navigator.pushNamed(context, AppRoutes.setProfile);


                await  SetPasswordCubit.get(context).setPasswordValidate(context);
setState(() {

});
                  //  Navigator.pushNamed(context, AppRoutes.setProfile);
                });
  },
),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
