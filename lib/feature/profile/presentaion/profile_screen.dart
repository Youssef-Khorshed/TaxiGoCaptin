import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/profile/presentaion/widgets/profile_screen_body.dart';

import '../../sign_in/presentaion/widgets/custom_auth_appbar.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: const Column(
              children: [
                CustomAuthAppBar(title: 'Profile'),
                ProfileForm(),
                SizedBox(height: 37),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
