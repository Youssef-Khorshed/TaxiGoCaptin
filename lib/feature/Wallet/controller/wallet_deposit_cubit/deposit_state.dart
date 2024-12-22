part of 'deposit_cubit.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

final class WalletLoading extends WalletState {}

final class WalletSuccess extends WalletState {
    final WalletModel walletModel;

  WalletSuccess({required this.walletModel});
}

final class WalletError extends WalletState {}
