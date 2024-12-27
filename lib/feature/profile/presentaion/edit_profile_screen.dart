import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/widgets/edit_profile_body.dart';

import '../../../core/Utils/colors/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: const EditProfileBody(),
    );
  }
}
