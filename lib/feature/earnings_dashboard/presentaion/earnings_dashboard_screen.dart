import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
        title: Visibility(
          visible: status,
          replacement: const Text("Not Available"),
          child: const Text("Available"),
        ),
        actions: [
          FlutterSwitch(
            width: 105.0,
            switchBorder: Border.all(color: AppColors.kWhite, width: 5),
            height: 45.0,
            valueFontSize: 25.0,
            toggleSize: 45.0,
            value: status,
            borderRadius: 30.0,
            inactiveIcon: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            inactiveColor: AppColors.kBackgroundColor,
            activeIcon: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            padding: 8.0,
            activeColor: AppColors.kBackgroundColor,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawerList(),
      ),
      body: const EarningsDashboardBody(),
    );
  }
}
