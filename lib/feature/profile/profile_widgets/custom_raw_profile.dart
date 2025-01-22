import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/assets/lottie.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_ErrorAnimation.dart';
import 'package:taxi_go_driver/feature/profile/controller/profile_states.dart';
import 'package:taxi_go_driver/feature/profile/controller/profile_view_model.dart';
import 'package:taxi_go_driver/feature/profile/profile_widgets/dummy_profile_body.dart';
import 'package:taxi_go_driver/feature/profile/profile_widgets/profile_info_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor2,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.profile,
            style: AppStyles.style16BlackW600),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: AppColors.blueColor,
            )),
      ),
      backgroundColor: AppColors.whiteColor2,
      body: BlocBuilder<ProfileViewModel, ProfileStates>(
        bloc: ProfileViewModel.get(context)..fetchPrfaileInfo(context),
        builder: (context, state) {
          if (state is ProfileFailureStates) {
            return CustomErroranimation(
              errormessage: state.errMessage,
              lottie: AppLottie.errorFailure,
            );
          }
          if (state is ProfileSuccessStates) {
            return ProfileInfoBody(
              userInfo: state.profielModel.data!.user!,
            );
          }
          return const Skeletonizer(child: DummyProfileBody());
        },
      ),
    );
  }
}
