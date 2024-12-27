import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/Core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';

import '../../../../../Core/Utils/validation.dart';
import '../../../../../core/Utils/text_styles/styles.dart';
import '../../../../APP/custom_widgets/Custom_button.dart';
import '../../../../APP/custom_widgets/custom_app_form_field.dart';
import '../../../../APP/custom_widgets/custom_loading.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../controller/set_new_password/set_new_password_cubit.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key, required this.phone});
  final String? phone;
  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 80),
            child: const CustomAuthAppBar()),
        body: Form(
          key: SetNewPasswordCubit.get(context).setNewPasswordFormKey,
          autovalidateMode:
              SetNewPasswordCubit.get(context).setNewPasswordAutoValidateMode,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(10),
                  AutoSizeText(
                    AppLocalizations.of(context)!.setYourPassword,
                    style: AppStyles.style24BlackW500,
                    textAlign: TextAlign.left,
                  ),
                  verticalSpace(10),
                  CustomAppFormField(
                    validator: (p0) =>
                        Validation.validatePassword(p0!, context),
                    isPassword: true,
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.enterYourPassword,
                    controller:
                        SetNewPasswordCubit.get(context).setPasswordController,
                    isNumbers: false,
                  ),
                  CustomAppFormField(
                    validator: (p0) =>
                        Validation.validatePassword(p0!, context),
                    isPassword: true,
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.confirmPassword,
                    controller: SetNewPasswordCubit.get(context)
                        .setPasswordConfirmationController,
                    isNumbers: false,
                  ),
                  const Spacer(),
                  BlocConsumer<SetNewPasswordCubit, SetNewPasswordState>(
                    listener: (context, state) {
                      if (state is SetNewPasswordSuccess) {
                        Navigator.pushReplacementNamed(
                            context, Routes.logIn);
                      } else if (state is SetNewPasswordError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.message),
                          duration: const Duration(seconds: 2),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is SetNewPasswordLoading) {
                        return const CustomLoading();
                      }
                      return CustomAppBottom(
                        onPressed: () async {
                          await SetNewPasswordCubit.get(context)
                              .setPasswordValidate(context,widget.phone!);
                          setState(() {});
                          // Navigator.pushReplacementNamed(
                          //     context, AppRoutes.generalScreen);
                        },
                        buttonText: AppLocalizations.of(context)!.save,
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
