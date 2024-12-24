import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/assets/assets.dart';

import '../../../../core/Utils/routes/routes.dart';
import '../../../APP/custom_widgets/custom_text.dart';
import 'drawer_item.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 50),
      children: [
        _buildProfileHeader(context),
        const SizedBox(height: 30),
        _buildDrawerItems(
          context,
        ),
      ],
    );
  }

  Widget _buildProfileHeader(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.accountScreen);
      },
      child: Column(
        children: [
          _buildProfileImage(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomText(
              text: "Mohamed Haggag",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile_image.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDrawerItems(
    context,
  ) {
    return Column(
      children: [
        _buildDrawerItem(
          icon: Assets.iconsHome,
          name: 'Home',
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[0]);
          },
        ),
        _buildDrawerItem(
          icon: Assets.iconsHistory,
          name: 'History',
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[1]);
          },
        ),
        _buildDrawerItem(
          icon: Assets.iconsWalletIcon,
          name: 'Wallet',
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[2]);
          },
        ),
        _buildDrawerItem(
          icon: Assets.iconsNotification,
          name: 'Notification',
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[3]);
          },
        ),
        _buildDrawerItem(
          icon: Assets.iconsMissionsIcon,
          name: 'Missions',
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[3]);
          },
        ),
        _buildDrawerItem(
          icon: Assets.iconsSettingsIcon,
          name: 'Account ',
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[4]);
          },
        ),
        _buildDrawerItem(
          icon: Assets.iconsLogOut,
          name: 'Log Out',
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[5]);
          },
        ),
      ],
    );
  }

  DrawerItem _buildDrawerItem({
    required String icon,
    required String name,
    required VoidCallback onTap,
  }) {
    return DrawerItem(
      onTap: onTap,
      icon: icon,
      name: name,
    );
  }
}

List drawerPageRoutes = [
  Routes.homeRoute,
  Routes.historyRoute,
  Routes.walletRoute,
  Routes.missionRoute,
  Routes.accountScreen,
  Routes.signInRoute
];
