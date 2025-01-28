import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/core/Firebase/firebase_notification.dart';
import 'package:taxi_go_driver/core/Utils/assets/icons.dart';
import 'package:taxi_go_driver/core/Utils/assets/images.dart';
import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import '../../../../core/Utils/Network/Services/secure_profile.dart';
import '../../../../core/Utils/routes/routes.dart';
import '../../../APP/custom_widgets/custom_text.dart';
import '../../../Auth/presentation/controller/log_out_cubit/log_out_cubit.dart';
import 'drawer_item.dart';

class DrawerList extends StatefulWidget {
  const DrawerList(
      {super.key, required this.selectedIndex, required this.onItemTap});
  final int selectedIndex;
  final Function(int index) onItemTap;
  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  String? name;

  String? image;
  void initState() {
    imageAndName();
    super.initState();
  }

  Future<void> imageAndName() async {
    image = await SecureProfile.getProfileImage();
    name = await SecureProfile.getProfileName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            _buildProfileHeader(context),
            verticalSpace(30.h),
            _buildDrawerItems(
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.profileRoute);
      },
      child: Column(
        children: [
          _buildProfileImage(),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: CustomText(
              text: name ?? AppLocalizations.of(context)!.user,
              style: AppStyles.text20Size500WightDarkGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 40,
      backgroundImage: image != null && image != ""
          ? NetworkImage(image!)
          : const AssetImage(
              AppImages.imagesProfileImage,
            ),
    );
  }

  Widget _buildDrawerItems(
    context,
  ) {
    var parentContext = context;
    return Column(
      children: [
        _buildDrawerItem(
          icon: AppIcons.iconsHome,
          name: AppLocalizations.of(context)!.home,
          onTap: () {
            Navigator.pushReplacementNamed(context, drawerPageRoutes[0]);
          },
        ),
        _buildDrawerItem(
          icon: AppIcons.iconsHistory,
          name: AppLocalizations.of(context)!.trips_history,
          onTap: () {
            Navigator.pushReplacementNamed(context, drawerPageRoutes[1]);
          },
        ),
        _buildDrawerItem(
          icon: AppIcons.iconsWalletIcon,
          name: AppLocalizations.of(context)!.wallet,
          onTap: () {
            Navigator.pushReplacementNamed(context, drawerPageRoutes[2]);
          },
        ),
        _buildDrawerItem(
          icon: AppIcons.notificationIcon,
          name: AppLocalizations.of(context)!.notifications,
          onTap: () {
            Navigator.pushReplacementNamed(context, drawerPageRoutes[3]);
          },
        ),
        BlocConsumer<LogOutCubit, LogOutState>(
          listener: (context, state) {
            if (state is LogOutSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.welcomeRoute, (route) => false);
            }
          },
          builder: (context, state) {
            return _buildDrawerItem(
              icon: AppIcons.iconsLogOut,
              name: AppLocalizations.of(context)!.log_out,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(AppLocalizations.of(context)!.exit),
                      content: Text(AppLocalizations.of(context)!.confirmExit),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!.no),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            LogOutCubit.get(parentContext)
                                .logOut(parentContext);
                            FirebaseNotification.removeToken(context);
                          },
                          child: Text(AppLocalizations.of(context)!.yes),
                        ),
                      ],
                    );
                  },
                );
              },
            );
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
  Routes.notificationRoute
];
