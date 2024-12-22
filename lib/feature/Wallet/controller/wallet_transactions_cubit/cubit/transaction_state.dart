part of 'transaction_cubit.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionInitial {}

final class TransactionSuccess extends TransactionInitial {
  final GetAllTransactionsModel transactionModel;

  TransactionSuccess({required this.transactionModel});
}

final class TransactionError extends TransactionInitial {}
