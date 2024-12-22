import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/Utils/Network/Services/services_locator.dart';
import '../../../core/Utils/colors/colors.dart';
import '../../../core/Utils/spacing/vertspace.dart';
import '../../../core/Utils/text_styles/styles.dart';
import '../controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'widgets/avaliable_balance_continer_widget.dart';
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
          title: AutoSizeText("Wallet", style: AppStyles.style20BlackW500),
          centerTitle: true,
        ),
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (context) => getIt<WalletGetProfileCubit>()
                  ..getProfile(context: context),
                child:
                    BlocBuilder<WalletGetProfileCubit, WalletGetProfileState>(
                  builder: (context, state) {
                    final walletGetProfileCubit =
                        context.read<WalletGetProfileCubit>();
                    if (state is WalletGetProfileLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is WalletGetProfileSuccess) {
                      return AvaliableBalanceContinerWidget(
                        amount: walletGetProfileCubit
                            .getProfileModel!.data!.balance
                            .toString(),
                      );
                    }
                    return const AutoSizeText('an error occurred');
                  },
                ),
              ),
              verticalSpace(10),
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
