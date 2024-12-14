import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/account_screen/presentaion/widgets/account_screen_body.dart';

import '../../../core/Utils/colors/colors.dart';
import '../../earnings_dashboard/presentaion/widgets/drawer_list.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      drawer: const Drawer(child: DrawerList()),
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        title: const Text(
          "My Account",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: const AccountScreenBody(),
    );
  }
}
