import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/Custom_button.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/ListTile.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/document_app_bar.dart';
import '../../../core/Utils/routes/routes.dart';

class CaptainDocuments extends StatelessWidget {
  const CaptainDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    List fieldsListTitle = [
      AppLocalizations.of(context)!.profile_photo,
      AppLocalizations.of(context)!.photo_of_Driving_license_front,
      AppLocalizations.of(context)!.photo_of_Driving_license_back,
      AppLocalizations.of(context)!.photo_of_nationa_ID_front,
      AppLocalizations.of(context)!.photo_of_nationa_ID_back,
      // AppLocalizations.of(context)!.driving_license,
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: documentCustomAppBar(context),
        // drawer: const Drawer(
        //   child: DrawerList(),
        // ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.kDarkBlue,
                    child: Text(
                      "1/5",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              verticalSpace(10.h),
              Expanded(
                child: ListView.builder(
                    itemCount: fieldsListTitle.length,
                    itemBuilder: (context, index) {
                      return CustomListTile(
                        title: fieldsListTitle[index],
                      );
                    }),
              ),
              verticalSpace(20.h),
              CustomAppBottom(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.homeRoute);
                },
                buttonText: AppLocalizations.of(context)!.next,
              ),
            ],
          ),
        ));
  }
}
