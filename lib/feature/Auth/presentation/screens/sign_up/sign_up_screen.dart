import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/app_custom_widgets/custom_app_bottom.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/enums/gender.dart';
import 'package:taxi_go_driver/core/Utils/routes/routes.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/core/Utils/validation.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_app_form_field.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/auth_widgets/custom_terms_check_box.dart';
import 'package:taxi_go_driver/feature/Auth/presentation/controller/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = true;

  @override
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
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            SignUpCubit cubit = SignUpCubit.get(context);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              child: Form(
                autovalidateMode: cubit.autoValidateMode,
                key: cubit.formKey1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20.h),
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
                    verticalSpace(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: AutoSizeText(
                        AppLocalizations.of(context)!.createAccount,
                        style: AppStyles.style24WhiteW500.copyWith(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    verticalSpace(10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                      child: Column(
                        children: [
                          CustomAppFormField(
                            isNumbers: false,
                            hintStyle: AppStyles.style14BlackW500,
                            validator: (p0) =>
                                Validation.validateName(p0, context),
                            hintText: AppLocalizations.of(context)!.name,
                            controller: SignUpCubit.get(context).nameController,
                          ),
                          verticalSpace(10.h),
                          CustomAppFormField(
                            isNumbers: true,
                            hintStyle: AppStyles.style14BlackW500,
                            hintText: AppLocalizations.of(context)!.phoneNumber,
                            validator: (p0) =>
                                Validation.validatePhone(p0, context),
                            controller: cubit.phoneController,
                            isPhone: true,
                          ),
                          verticalSpace(10.h),
                          CustomDropDownFormFieldAuth(
                            items: SignUpCubit.get(context).genderList(context),
                            nameTextStyle: AppStyles.style14BlackW500,
                            name: selectedGender == Gender.non.name
                                ? AppLocalizations.of(context)!
                                    .please_select_gender
                                : selectedGender,
                            bordercolor: AppColors.blackColor.withAlpha(70),
                            onChanged: (value) {
                              SignUpCubit.get(context).selectedGender =
                                  value == AppLocalizations.of(context)!.male
                                      ? Gender.male
                                      : Gender.female;
                              setState(() {});
                              selectedGender = value!;
                            },
                          ),
                          verticalSpace(10.h),
                          CustomTermsCheckBox(
                            isChecked: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpSuccess) {
                          Navigator.pushNamed(context, Routes.setPassword);
                        } else if (state is SignUpFailure) {
                          Fluttertoast.showToast(
                            msg: state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is SignUpLoading) {
                          return const CustomLoading();
                        } else {
                          return CustomAppBottom(
                              borderCornerRadius: 10.r,
                              buttonText: AppLocalizations.of(context)!.sign_up,
                              onPressed: () async {
                                // Navigator.pushNamed(context, AppRoutes.otp);
                                if (!_isChecked) {
                                  Fluttertoast.showToast(
                                    msg: "Please accept terms",
                                  );
                                }
                                SignUpCubit.get(context).validate(context);

                                // Navigator.pushNamed(context, AppRoutes.otp);

                                setState(() {});
                              });
                        }
                      },
                    ),
                    verticalSpace(10.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: AppLocalizations.of(context)!
                              .already_have_an_account,
                          style: AppStyles.style20BlackW500
                              .copyWith(fontSize: 12.sp),
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context)!.logIn,
                              style: AppStyles.style16WhiteW500.copyWith(
                                  color: AppColors.blueColor, fontSize: 13.sp),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Routes.logIn);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // verticalSpace(20.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
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
            border: Border.all(color: widget.bordercolor, width: 2.w),
            borderRadius: BorderRadius.circular(10.r)),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        useSafeArea: true,
      ),
      hint: Text(
        selectedValue ?? widget.name,
        style: widget.nameTextStyle,
        textAlign: TextAlign.center,
      ),
      items: widget.items
          .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
          .toList(),
      onChanged: widget.onChanged,
    );
  }
}
