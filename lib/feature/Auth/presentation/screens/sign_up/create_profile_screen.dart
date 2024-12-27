import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';

import '../../../../../Core/Utils/validation.dart';
import '../../../../../core/Utils/colors/colors.dart';
import '../../../../../core/Utils/routes/routes.dart';
import '../../../../../core/Utils/spacing/vertspace.dart';
import '../../../../APP/custom_widgets/custom_app_form_field.dart';
import '../../../../APP/custom_widgets/custom_loading.dart';
import '../../auth_widgets/CustomerDropDownFormField2.dart';
import '../../auth_widgets/custom_set_profile_bottoms.dart';
import '../../controller/create_profile_cubit/create_profile_cubit.dart';
import '../../controller/image_cubit/image__cubit.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  void initState() {
    getCities();
    super.initState();
  }

  Future<void> getCities() async {
    await CreateProfileCubit.get(context).getCities(context);
    setState(() {});
  }

  File? file;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CreateProfileCubit, CreateProfileState>(
          listener: (context, state) {
            if (state is CreateProfileSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeRoute, (route) => false);
            }
          },
          builder: (context, state) {
            print(state);
            if (state is CreateProfileLoading) {
              return const CustomLoading();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
              child: Form(
                key: CreateProfileCubit.get(context).formKey,
                autovalidateMode:
                    CreateProfileCubit.get(context).autovalidateMode,
                child: SingleChildScrollView(
                  child: Column(
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
                          Text(AppLocalizations.of(context)!.back,
                              style: AppStyles.textStyle20)
                        ]),
                      ),
                      verticalSpace(30),
                      Stack(
                        children: [
                          BlocProvider(
                            create: (_) => ImageCubit(),
                            child: BlocBuilder<ImageCubit, ImageState>(
                              builder: (context, state) {
                                file = ImageCubit.get(context).file;
                                Widget avatarContent;

                                if (state is ImagePicked) {
                                  avatarContent = ClipOval(
                                    child: Image.file(
                                      state.image,
                                      width: 130.w,
                                      height: 130.h,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  avatarContent = CircleAvatar(
                                    radius: 65.r,
                                    backgroundColor: Colors.grey[300],
                                    child: Icon(
                                      Icons.person,
                                      size: 60.h,
                                      color: Colors.grey[600],
                                    ),
                                  );
                                }

                                return Stack(
                                  children: [
                                    avatarContent,
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () => context
                                            .read<ImageCubit>()
                                            .pickImage(),
                                        child: CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor: Colors.blue,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 18.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(30),
                      // const CustomAppFormField(
                      //
                      //
                      //   isPassword: false,
                      //   obscureText: false,
                      //   hintText: "Enter Your Name",
                      //   isPhone: false,
                      // ),
                      // verticalSpace(10),
                      // CustomAppFormField(
                      //   isPassword: false,
                      //   obscureText: false,
                      //   hintText: "Enter Your Phone Number",
                      //   controller: CreateProfileCubit.get(context).emailController,
                      //   isPhone: true,
                      // ),
                      // verticalSpace(10),
                      // CustomAppFormField(
                      //   isPassword: false,
                      //   obscureText: false,
                      //   validator:(value) {
                      //     return  Validation.validateName(value, context);
                      //   },
                      //   controller: CreateProfileCubit.get(context).emailController,
                      //   hintText: "Enter Your Email",
                      //   isPhone: false,
                      // ),
                      verticalSpace(10),
                      CustomAppFormField(
                        validator: (value) {

                          return Validation.validateName(value, context);
                        },
                        controller:
                            CreateProfileCubit.get(context).streetController,
                        isPassword: false,
                        obscureText: false,
                        hintText: AppLocalizations.of(context)!.enterYourStreet,
                        isPhone: false,
                      ),
                      verticalSpace(10),

                      CustomDropDownFormField3(
                        onChanged: (p0) async {
                          CreateProfileCubit.get(context).selectedDistrictId =
                              p0!.id!.toString();

                          await CreateProfileCubit.get(context)
                              .getDistricts(context, p0!.id!);
                        },
                        items: CreateProfileCubit.get(context)
                                .getCitiesModel
                                ?.data
                                ?.cities ??
                            [],
                        name: AppLocalizations.of(context)!.city,
                      ),
                      verticalSpace(10),

                      CustomDropDownFormField2(
                        onChanged: (p0) {
                          CreateProfileCubit.get(context).selectedDistrictId =
                              p0!.id!.toString();
                          print(
                              "EEEEEEEEEEEEEEEE${CreateProfileCubit.get(context).selectedDistrictId}");
                        },
                        items: CreateProfileCubit.get(context)
                                .directionModel
                                ?.data
                                ?.cities ??
                            [],
                        name: AppLocalizations.of(context)!.district,
                      ),
                      verticalSpace(20),
                      Row(
                        children: [
                          /*      Expanded(
                        child: CustomSetProfileButtoms(
                          text: "Cancel",
                          backgroundColor: AppColors.whiteColor,
                          textColor: AppColors.blackColor,
                          borderColor: AppColors.blueColor,
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.logIn, (route) => false);

                          },
                        ),
                      ),*/
                          /*        horizontalSpace(10),*/
                          Expanded(
                            child: CustomSetProfileButtoms(
                              text: AppLocalizations.of(context)!.save,
                              backgroundColor: AppColors.blueColor,
                              textColor: AppColors.whiteColor,
                              onPressed: () async {
                              await  CreateProfileCubit.get(context)
                                    .createProfileValidate(context, file);
                              setState(() {

                              });
                                // Navigator.pushNamed(context, AppRoutes.generalScreen);
                              },
                            ),
                          ),
                        ],
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
} /**/
