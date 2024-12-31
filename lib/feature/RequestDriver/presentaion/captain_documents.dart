import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/Custom_button.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/RequestDriver/controller/cubit/captain_documents_cubit.dart';
import 'package:taxi_go_driver/feature/RequestDriver/data/models/captain_documents_model.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/ListTile.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/custom_loading.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/document_app_bar.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/documents_form_row.dart';
import '../../../core/Utils/routes/routes.dart';

class CaptainDocuments extends StatefulWidget {
  const CaptainDocuments({super.key});

  @override
  State<CaptainDocuments> createState() => _CaptainDocumentsState();
}

class _CaptainDocumentsState extends State<CaptainDocuments> {
  File? profilePhoto;
  File? drivingLicenseFront;
  File? drivingLicenseBack;
  File? nationalIdFront;
  File? nationalIdBack;
  File? vehicleLicenseFront;
  File? vehicleLicenseBack;
  String? vehicleModel;
  String? vehicleColor;
  String? vehicleNumber;
  int documentsCounts = 0;
  final _formKey = GlobalKey<FormState>();
  bool dataComplete = true;

  final Map<String, bool> widgetCompletionStatus = {
    "profilePhoto": false,
    "drivingLicenseFront": false,
    "drivingLicenseBack": false,
    "nationalIdFront": false,
    "nationalIdBack": false,
    "vehicleLicenseFront": false,
    "vehicleLicenseBack": false,
    "vehicleModel": false,
    "vehicleColor": false,
    "vehicleNumber": false,
  };

  void _updateCounter(String key, bool isCompleted) {
    if (widgetCompletionStatus[key] != isCompleted) {
      setState(() {
        widgetCompletionStatus[key] = isCompleted;
        documentsCounts = widgetCompletionStatus.values.where((v) => v).length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: documentCustomAppBar(context),
      body: BlocConsumer<CaptainDocumentsCubit, CaptainDocumentsState>(
        listener: (context, state) {
          if (state is CaptainDocumentsSuccess && state.success) {
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CaptainDocumentsCubit>();

          return Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 23.r,
                      backgroundColor: AppColors.kDarkBlue,
                      child: Text(
                        "${documentsCounts}/10",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                verticalSpace(10.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomListTile(
                          title: AppLocalizations.of(context)!.profile_photo,
                          dataComplete: dataComplete,
                          selectedImage: (image) {
                            setState(() {
                              profilePhoto = image;
                              _updateCounter("profilePhoto", image != null);
                            });
                          },
                        ),
                        CustomListTile(
                          title: AppLocalizations.of(context)!
                              .photo_of_Driving_license_front,
                          selectedImage: (image) {
                            setState(() {
                              drivingLicenseFront = image;
                              _updateCounter(
                                  "drivingLicenseFront", image != null);
                            });
                          },
                        ),
                        CustomListTile(
                          title: AppLocalizations.of(context)!
                              .photo_of_Driving_license_back,
                          dataComplete: dataComplete,
                          selectedImage: (image) {
                            setState(() {
                              drivingLicenseBack = image;
                              _updateCounter(
                                  "drivingLicenseBack", image != null);
                            });
                          },
                        ),
                        CustomListTile(
                          title: AppLocalizations.of(context)!
                              .photo_of_nationa_ID_front,
                          dataComplete: dataComplete,
                          selectedImage: (image) {
                            setState(() {
                              nationalIdFront = image;
                              _updateCounter("nationalIdFront", image != null);
                            });
                          },
                        ),
                        CustomListTile(
                          title: AppLocalizations.of(context)!
                              .photo_of_nationa_ID_back,
                          dataComplete: dataComplete,
                          selectedImage: (image) {
                            setState(() {
                              nationalIdBack = image;
                              _updateCounter("nationalIdBack", image != null);
                            });
                          },
                        ),
                        CustomListTile(
                          title: AppLocalizations.of(context)!
                              .vehicle_license_front,
                          dataComplete: dataComplete,
                          selectedImage: (image) {
                            setState(() {
                              vehicleLicenseFront = image;
                              _updateCounter(
                                  "vehicleLicenseFront", image != null);
                            });
                          },
                        ),
                        CustomListTile(
                          title: AppLocalizations.of(context)!
                              .vehicle_license_back,
                          dataComplete: dataComplete,
                          selectedImage: (image) {
                            setState(() {
                              vehicleLicenseBack = image;
                              _updateCounter(
                                  "vehicleLicenseBack", image != null);
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DocumentsFormRow(
                                  label: AppLocalizations.of(context)!
                                      .vehicle_model,
                                  onChanged: (value) {
                                    vehicleModel = value;
                                    _updateCounter(
                                        "vehicleModel", value.isNotEmpty);
                                  },
                                ),
                                verticalSpace(10.h),
                                DocumentsFormRow(
                                  label: AppLocalizations.of(context)!
                                      .vehicle_color,
                                  onChanged: (value) {
                                    vehicleColor = value;
                                    _updateCounter(
                                        "vehicleColor", value.isNotEmpty);
                                  },
                                ),
                                verticalSpace(10.h),
                                DocumentsFormRow(
                                  label: AppLocalizations.of(context)!
                                      .vehicle_number,
                                  onChanged: (value) {
                                    vehicleNumber = value;
                                    _updateCounter(
                                        "vehicleNumber", value.isNotEmpty);
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
                verticalSpace(20.h),
                state is CaptainDocumentsLoading
                    ? const DoucmentsCustomLoading()
                    : state is CaptainDocumentsFailure
                        ? CustomErroranimation(
                            errormessage: state.message,
                            lottie: AppLottie.errorFailure,
                          )
                        : SizedBox(
                            height: 55.h,
                            child: CustomAppBottom(
                              borderCornerRadius: 10.r,
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    documentsCounts == 10) {
                                  cubit.postCaptainDocuments(
                                    context,
                                    CaptainDocumentsModel(
                                      profilePhoto: profilePhoto,
                                      drivingLicenseFront: drivingLicenseFront,
                                      drivingLicenseBack: drivingLicenseBack,
                                      nationalIdFront: nationalIdFront,
                                      nationalIdBack: nationalIdBack,
                                      vehicleLicenseFront: vehicleLicenseFront,
                                      vehicleLicenseBack: vehicleLicenseBack,
                                      vehicleModel: vehicleModel,
                                      vehicleColor: vehicleColor,
                                      vehicleNumber: vehicleNumber,
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    dataComplete = false;
                                  });
                                }
                              },
                              buttonText: AppLocalizations.of(context)!.next,
                            ),
                          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
