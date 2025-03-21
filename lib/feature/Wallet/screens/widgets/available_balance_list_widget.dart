import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_driver/core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_driver/feature/APP/custom_widgets/custom_loading.dart';
import '../../controller/wallet_get_profile_cubit/cubit/wallet_get_profile_cubit.dart';
import 'avaliable_balance_continer_widget.dart';

class AvailableBalanceListWidget extends StatelessWidget {
  const AvailableBalanceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WalletGetProfileCubit>()..getProfile(context: context),
      child: BlocBuilder<WalletGetProfileCubit, WalletGetProfileState>(
        builder: (context, state) {
          final walletGetProfileCubit = context.read<WalletGetProfileCubit>();
          if (state is WalletGetProfileLoading) {
            return const Center(child: CustomLoading());
          } else if (state is WalletGetProfileSuccess) {
            return AvaliableBalanceContinerWidget(
              amount: walletGetProfileCubit.getProfileModel?.data!.balance
                      .toString() ??
                  "0",
            );
          }
          return state is WalletGetProfileError
              ? Container(
                  child: Text(state.message),
                )
              : Container();
        },
      ),
    );
  }
}
