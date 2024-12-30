

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_all_transactions_model.dart';
import '../../../data/repo/wallet_repo.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final WalletRepo walletRepo;
  GetAllTransactionsModel? getAllTransactionsModel;

  TransactionCubit(this.walletRepo) : super(TransactionInitial());

  Future<void> getAllTransactions({
    String? paymentMethod,
    String? transactionType,
    required BuildContext context,
  }) async {
    emit(TransactionLoading());
    print('Fetching transactions with parameters:');
    print('paymentMethod: ${paymentMethod ?? "null"}');
    print('transactionType: ${transactionType ?? "null"}');

    final response = await walletRepo.getAllTransactions(
      paymentMethod: paymentMethod ?? '', 
      transactionType: transactionType ?? '',
      context: context,
    );

    response.fold(
      (onError) {
        
        print("Error occurred: $onError");
        emit(TransactionError());
      },
      (onSuccess) {
       
        print("Wallet data fetched successfully.");
        getAllTransactionsModel = onSuccess;
        emit(TransactionSuccess(transactionModel: getAllTransactionsModel!));
      },
    );
  }
}
