import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Core/Utils/Network/Services/services_locator.dart';
import '../../controller/wallet_transactions_cubit/cubit/transaction_cubit.dart';
import 'transaction_card_widget.dart';

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TransactionCubit>()..getAllTransactions(context: context),
      child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          final transactionCubit = context.read<TransactionCubit>();
          if (state is TransactionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TransactionSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: transactionCubit.getAllTransactionsModel?.data!.length,
              itemBuilder: (context, index) {
                return TransactionCardWidget(
                  amount: transactionCubit
                          .getAllTransactionsModel?.data![index].amount ??
                      '1000 ',
                  inside: transactionCubit.getAllTransactionsModel?.data![index]
                              .transactionType ==
                          'charge' ||
                      transactionCubit.getAllTransactionsModel?.data![index]
                              .transactionType ==
                          'withdraw' ||
                      transactionCubit.getAllTransactionsModel?.data![index]
                              .transactionType ==
                          'adjustment',
                  dateTime: transactionCubit
                          .getAllTransactionsModel?.data![index].createdAt ??
                      '',
                  paymentType: getTransactionTypeTranslation(
                    context,
                    transactionCubit.getAllTransactionsModel?.data![index]
                            .transactionType ??
                        '',
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

String getTransactionTypeTranslation(
    BuildContext context, String transactionType) {
  switch (transactionType) {
    case 'payment':
      return AppLocalizations.of(context)!.transaction_payment;
    case 'remaining':
      return AppLocalizations.of(context)!.transaction_remaining;
    case 'charge':
      return AppLocalizations.of(context)!.transaction_charge;
    case 'payout':
      return AppLocalizations.of(context)!.transaction_payout;
    case 'adjustment':
      return AppLocalizations.of(context)!.transaction_adjustment;
    case 'withdraw':
      return AppLocalizations.of(context)!.transaction_withdraw;
    default:
      return transactionType; // Return the original value if no match is found
  }
}
