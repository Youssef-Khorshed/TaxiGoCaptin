import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/History/Screens/my_history.dart';
import 'package:taxi_go_driver/feature/earnings_dashboard/presentaion/widgets/drawer_list.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/spacing/vertspace.dart';
import '../../../core/Utils/text_styles/styles.dart';
import 'widgets/available_balance_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/transactions_list_widgte.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
      appBar: drawerAppBar(
        name: AppLocalizations.of(context)!.wallet,
        image: "",
      ),
      drawer: Drawer(
        child: DrawerList(
          onItemTap: (index) => onItemTap(index),
          selectedIndex: selctedIndex,
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20.h),
            const AvailableBalanceListWidget(),
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: AutoSizeText(AppLocalizations.of(context)!.transactions,
                  style: AppStyles.style16BlackW600),
            ),
            const Expanded(
              child: TransactionsListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
