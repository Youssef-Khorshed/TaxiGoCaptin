import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:taxi_go_driver/core/Utils/spacing/vertspace.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/drawer_list.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/earnings_dashboard_body.dart';
import '../../../core/Utils/colors/colors.dart';

class EarningsDashboardScreen extends StatefulWidget {
  const EarningsDashboardScreen({super.key});

  @override
  State<EarningsDashboardScreen> createState() =>
      _EarningsDashboardScreenState();
}

class _EarningsDashboardScreenState extends State<EarningsDashboardScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.home,
          style: AppStyles.text20Size500WightDarkGray,
        ),
        actions: [
          FlutterSwitch(
            width: 60.w,
            height: 30.h,
            value: status,
            borderRadius: 30.0,
            inactiveIcon: CircleAvatar(
              backgroundColor: AppColors.kComplete,
            ),
            inactiveColor: AppColors.kComplete,
            activeIcon: const CircleAvatar(
              backgroundColor: Colors.red,
            ),
            padding: 8.w,
            activeColor: AppColors.kRedMap,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
          horizontalSpace(10.w),
        ],
      ),
      drawer: const Drawer(
        child: DrawerList(),
      ),
      body: const EarningsDashboardBody(),
    );
  }
}
