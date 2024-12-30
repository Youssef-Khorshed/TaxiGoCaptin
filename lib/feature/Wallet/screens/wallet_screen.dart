import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/spacing/vertspace.dart';
import '../../../core/Utils/text_styles/styles.dart';
import 'widgets/available_balance_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/transactions_list_widgte.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: AutoSizeText(AppLocalizations.of(context)!.wallet,
              style: AppStyles.style20BlackW500),
          centerTitle: true,
        ),
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
      ),
    );
  }
}
