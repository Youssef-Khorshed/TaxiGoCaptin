import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/drawer_app_bar.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/drawer_list.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/text_styles/styles.dart';
import 'widgets/notification_list_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selctedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onItemTap(int index) {
      setState(() {
        selctedIndex = index;
      });
      Navigator.pop(context);
    }

    return Scaffold(
      drawer: Drawer(
        child: DrawerList(
          onItemTap: (index) => onItemTap(index),
          selectedIndex: selctedIndex,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: FutureBuilder<AppBar>(
          future: drawerAppBar(
            name: AppLocalizations.of(context)!.notifications,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AppBar(
                backgroundColor: AppColors.whiteColor,
                title: Text(
                  AppLocalizations.of(context)!.notifications,
                  style: AppStyles.style16BlackW600,
                ),
                centerTitle: true,
              );
            } else if (snapshot.hasError) {
              return AppBar(
                backgroundColor: AppColors.whiteColor,
                title: Text(
                  AppLocalizations.of(context)!.notifications,
                  style: AppStyles.style16BlackW600,
                ),
                centerTitle: true,
              );
            } else {
              return snapshot.data!;
            }
          },
        ),
      ),

      // AppBar(
      //   backgroundColor: AppColors.whiteColor,
      //   title: AutoSizeText(
      //     AppLocalizations.of(context)!.notifications,
      //     style: AppStyles.style20BlackW500,
      //   ),
      //   centerTitle: true,
      // ),

      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: const NotificationListWidget(),
      ),
    );
  }
}
