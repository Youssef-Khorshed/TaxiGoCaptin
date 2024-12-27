import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/enums/gender.dart';
import '../../../../../Core/Utils/validation.dart';
import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/routes/routes.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../../core/Utils/text_styles/styles.dart';
import '../../../../APP/custom_widgets/custom_app_bottom.dart';
import '../../../../APP/custom_widgets/custom_app_form_field.dart';
import '../../../../APP/custom_widgets/custom_loading.dart';
import '../../auth_widgets/custom_auth_app_bar.dart';
import '../../auth_widgets/custom_terms_check_box.dart';
import '../../controller/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  String selectedGender = Gender.non.name;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              Navigator.pushReplacementNamed(context, Routes.otp);
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
          },
          builder: (context, state) {
            SignUpCubit cubit = SignUpCubit.get(context);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              child: Form(
                autovalidateMode: cubit.autoValidateMode,
                key: cubit.formKey1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAuthAppBar(),
                      verticalSpace(10),
                      Text(
                        AppLocalizations.of(context)!.createAccount,
                        style: AppStyles.style24WhiteW500
                            .copyWith(color: Colors.black),
                      ),
                      verticalSpace(10),
                      CustomAppFormField(
                        validator: (p0) => Validation.validateName(p0, context),
                        hintText: AppLocalizations.of(context)!.name,
                        controller: SignUpCubit.get(context).nameController,
                      ),
                      verticalSpace(10),
                      CustomAppFormField(
                        hintText: AppLocalizations.of(context)!.phoneNumber,
                        validator: (p0) =>
                            Validation.validatePhone(p0, context),
                        controller: cubit.phoneController,
                        isPhone: true,
                      ),
                      verticalSpace(10),
                      CustomDropDownFormFieldAuth(
                        items: SignUpCubit.get(context).genderList(context),
                        nameTextStyle: AppStyles.textStyle14,
                        name: selectedGender == Gender.non.name
                            ? AppLocalizations.of(context)!.please_select_gender
                            : selectedGender,
                        onChanged: (value) {
                          SignUpCubit.get(context).selectedGender =
                              value == AppLocalizations.of(context)!.male
                                  ? Gender.male
                                  : Gender.female;
                          setState(() {});
                          selectedGender = value!;
                        },
                      ),
                      verticalSpace(10),
                      CustomTermsCheckBox(
                        isChecked: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      verticalSpace(20),
                      BlocConsumer<SignUpCubit, SignUpState>(
                        listener: (context, state) {
                          if (state is SignUpSuccess) {
                            Navigator.pushNamed(context, Routes.otp);
                          } else if (state is SignUpFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.message),
                            ));
                          }
                        },
                        builder: (context, state) {
                          if (state is SignUpLoading) {
                            return const CustomLoading();
                          } else {
                            return CustomAppBottom(
                              buttonText: AppLocalizations.of(context)!.sign_up,
                              onPressed: _isChecked
                                  ? () async {
                                      //  Navigator.pushNamed(context, Routes.otp);

                                   await   cubit.validate(context);setState(() {

                                      });
                                    }
                                  : () {},
                            );
                          }
                        },
                      ),
                      verticalSpace(10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: AppLocalizations.of(context)!
                                .already_have_an_account,
                            style: AppStyles.textStyle20
                                .copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.logIn,
                                style: AppStyles.style16WhiteW500
                                    .copyWith(color: AppColors.blueColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, Routes.logIn);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomDropDownFormFieldAuth extends StatefulWidget {
  final List<String> items;
  final String name;
  final Color? backgroundcolor;
  final Color bordercolor;
  final Color? iconEnabledColor;
  final Gradient? gradient;
  final TextStyle? nameTextStyle;
  CustomDropDownFormFieldAuth(
      {super.key,
      required this.items,
      required this.name,
      this.gradient,
      this.iconEnabledColor,
      this.nameTextStyle,
      this.bordercolor = AppColors.blackColor,
      this.backgroundcolor,
      this.onChanged});
  void Function(String?)? onChanged;

  @override
  State<CustomDropDownFormFieldAuth> createState() =>
      _CustomDropDownFormFieldAuthState();
}

class _CustomDropDownFormFieldAuthState
    extends State<CustomDropDownFormFieldAuth> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: const SizedBox(),
      isExpanded: true,
      iconStyleData: IconStyleData(iconEnabledColor: widget.iconEnabledColor),
      buttonStyleData: ButtonStyleData(
        decoration: BoxDecoration(
            gradient: widget.gradient,
            color: widget.backgroundcolor,
            border: Border.all(color: widget.bordercolor, width: 1),
            borderRadius: BorderRadius.circular(10)),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        useSafeArea: true,
      ),
      hint: Text(
        selectedValue ?? widget.name,
        style: widget.nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: widget.items
          .map((gender) =>
              DropdownMenuItem(value: gender, child: Text(gender)))
          .toList(),
      onChanged: widget.onChanged,
    );
  }
}
