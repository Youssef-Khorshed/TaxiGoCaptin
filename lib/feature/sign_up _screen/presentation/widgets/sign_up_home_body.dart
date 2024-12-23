import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/enums/gender.dart';
import 'package:taxi_go_driver/core/Utils/validation.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/presentation/widgets/phone_number_field.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/presentation/widgets/signIn_prompt.dart';
import 'package:taxi_go_driver/feature/sign_up%20_screen/presentation/widgets/sign_up_boutton.dart';

import '../../../../core/Utils/routes/routes.dart';
import '../../../APP/custom_widgets/custom_loading.dart';
import '../controller/sign_up_cubit.dart';
import 'TermsAndPrivacyText.dart';
import 'custom_gender_field.dart';
import 'custom_text_field.dart';
import 'or_divider.dart';
import 'social_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpHomeBody extends StatefulWidget {
  SignUpHomeBody({super.key});

  @override
  State<SignUpHomeBody> createState() => _SignUpHomeBodyState();
}

final formKey = GlobalKey<FormState>();

class _SignUpHomeBodyState extends State<SignUpHomeBody> {
  @override
  void dispose() {
    SignUpCubit.get(context).formKey1.currentState?.dispose();
    SignUpCubit.get(context).phoneController.dispose();
    SignUpCubit.get(context).nameController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushNamed(context, Routes.otpScreen);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: Form(
                autovalidateMode: cubit.autoValidateMode,
                key: cubit.formKey1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.sign_up,
                          style: TextStyle(fontSize: 30.r),
                        ),
                        15.verticalSpace,
                        CustomTextField(
                          validator: (p0) => Validation.validateName(p0, context),
                          controller: SignUpCubit.get(context).nameController,
                          label: AppLocalizations.of(context)!.name,
                        ),
                        PhoneNumberFailed(
                          validator: (p0) => Validation.validatePhone(p0, context),
                          controller: cubit.phoneController,
                        ),
                        CustomGenderField(
                          genderOptions: [
                            AppLocalizations.of(context)!.male,
                            AppLocalizations.of(context)!.female
                          ],
                          label: AppLocalizations.of(context)!.male,
                          onChanged: (String? value) {
                            cubit.selectedGender =
                                value == AppLocalizations.of(context)!.male
                                    ? Gender.male
                                    : Gender.female;
                          },
                        ),
                        15.verticalSpace,
                        TermsAndPrivacyText(),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            15.verticalSpace,

            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return CustomLoading();
                } else
                  return SignUpButton(
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.setPassowrdRoute);
                      cubit.validate(context);
                    },
                  );
              },
            ),
            20.verticalSpace,
            const SignInPrompt(),
            10.verticalSpace
          ],
        );
      },
    );
  }
}
