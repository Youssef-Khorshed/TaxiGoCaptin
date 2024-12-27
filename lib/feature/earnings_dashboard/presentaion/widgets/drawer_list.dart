import 'package:flutter/material.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../../../APP/custom_widgets/custom_text.dart';
import 'drawer_item.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          _buildProfileHeader(context),
          verticalSpace(30),
          _buildDrawerItems(
            context,
          ),
        ],
      ),
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomText(
              text: "محمد عبدالمجيد",
              style: AppStyles.text20Size500WightDarkGray,
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
          AppImages.imagesProfileImage,
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
          icon: AppIcons.iconsHome,
          name: AppLocalizations.of(context)!.home,
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[0]);
          },
        ),
        _buildDrawerItem(
          icon: AppIcons.iconsHistory,
          name: AppLocalizations.of(context)!.history,
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[1]);
          },
        ),
        _buildDrawerItem(
          icon: AppIcons.iconsWalletIcon,
          name: AppLocalizations.of(context)!.wallet,
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[2]);
          },
        ),
        _buildDrawerItem(
          icon: AppIcons.iconsSettingsIcon,
          name: AppLocalizations.of(context)!.account,
          onTap: () {
            Navigator.pushNamed(context, drawerPageRoutes[4]);
          },
        ),
        _buildDrawerItem(
          icon: AppIcons.iconsLogOut,
          name: AppLocalizations.of(context)!.log_out,
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
];
